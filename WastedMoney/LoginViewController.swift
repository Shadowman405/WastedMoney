//
//  ViewController.swift
//  WastedMoney
//
//  Created by Maxim Mitin on 2.09.23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginImg: UIImageView!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        emailTxtFld.placeholder = "Please enter email...."
        emailTxtFld.keyboardType = .emailAddress
        passwordTxtFld.placeholder = "Password...."
        passwordTxtFld.isSecureTextEntry = true
    }

    //MARK: - Buttons
    

    @IBAction func loginTaped(_ sender: Any) {
    }
    
    @IBAction func registerTaped(_ sender: Any) {
    }
    
}

