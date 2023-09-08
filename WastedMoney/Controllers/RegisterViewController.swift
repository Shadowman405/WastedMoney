//
//  RegisterViewController.swift
//  WastedMoney
//
//  Created by Maxim Mitin on 3.09.23.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailRegTxtFld: UITextField!
    @IBOutlet weak var passRegTxtFld: UITextField!
    private let firebaseManager = FirebaseAuthManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        emailRegTxtFld.keyboardType = .emailAddress
        emailRegTxtFld.delegate = self
        passRegTxtFld.delegate = self
    }
    
    @IBAction func RegisterTaped(_ sender: Any) {
        if let email = emailRegTxtFld.text, let password = passRegTxtFld.text {
            firebaseManager.createUser(email: email, password: password) { success in
                if success != true {
                    self.showAlert(alertTitle: "Error", alertMessage: "Please enter correct email")
                } else {
                    self.showAlert(alertTitle: "Success", alertMessage: "User succefully created")
                    self.emailRegTxtFld.text = ""
                    self.passRegTxtFld.text = ""
                }
            }
        }
    }
    
    
    func showAlert(alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

//MARK: - Extensions

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
