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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    @IBAction func RegisterTaped(_ sender: Any) {
        if let email = emailRegTxtFld.text, let password = passRegTxtFld.text {
            Auth.auth().createUser(withEmail: email, password: password)
        }
    }
    
}
