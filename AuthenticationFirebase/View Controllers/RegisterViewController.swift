//
//  RegisterController.swift
//  AuthenticationFirebase
//
//  Created by Daesy & Mindy on 2/24/23.
//
// 1 Add packages using Swift Package Manager
// 2 Add repository: https://github.com/firebase-ios-sdk
// 3 Choose firebase authentication library
// 4 connect an app & enable email/password sign in in firebase console
// 5 set up app delegate
// 6 add import statements

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    // complete any validation needed for email and password
    // create an account by passing user's email & password to createUser
    // If successful, account data is passed to callback method in result object
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
//    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func validateFields() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        return nil
    }
    

    @IBAction func signInButtonPressed(_ sender: UIButton) {
        let error = validateFields()
        if error != nil {
            print("All fields need to be filled.")
        } else {
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
//            Auth.auth().createUser(withEmail: email, password: password) {
//                result, err in
//                if err != nil {
//                    print("Error creating user.")
//                }
//                guard let resultUser = result?.user else {
//                    return
//                }
//            }
        }
    }
}
