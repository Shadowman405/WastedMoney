//
//  FirebaseManager.swift
//  WastedMoney
//
//  Created by Maxim Mitin on 8.09.23.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class FirebaseAuthManager {
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
    }
    
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass){ result, error in
            if error != nil {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
            
        }
    }
}
