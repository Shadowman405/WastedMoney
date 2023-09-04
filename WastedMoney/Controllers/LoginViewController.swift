//
//  ViewController.swift
//  WastedMoney
//
//  Created by Maxim Mitin on 2.09.23.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginImg: UIImageView!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupKeyboardHiding()
    }

    
    //MARK: - Funcs
    
    func setupUI() {
        emailTxtFld.placeholder = "Please enter email...."
        emailTxtFld.keyboardType = .emailAddress
        passwordTxtFld.placeholder = "Password...."
        passwordTxtFld.isSecureTextEntry = true
        
        emailTxtFld.delegate = self
        passwordTxtFld.delegate = self
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    //MARK: - Buttons

    @IBAction func loginTaped(_ sender: Any) {
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                self.performSegue(withIdentifier: "toPersons", sender: nil)
            }
        }
    }
    
}


//MARK: - ext for view and kboard delegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTxtFld = UIResponder.currentFirst() as? UITextField else {return}
        
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTxtFld.frame, from: currentTxtFld.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        if textFieldBottomY > keyboardTopY {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 2) * -1
            view.frame.origin.y = newFrameY
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}

//MARK: - extensin for Responder
extension UIResponder {
    private struct Static {
        static weak var responder: UIResponder?
    }
    
    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }
    
    @objc private func _trap() {
        Static.responder = self
    }
    
}

