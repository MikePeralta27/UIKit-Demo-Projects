//
//  RegisterViewController.swift
//  Flash Chat Personal IOS
//
//  Created by Michael Peralta on 1/19/23.
//

import UIKit
//import FirebaseCore
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                } else {
                    //navigate to ChatViewController
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
            
        }
        
    }
}
