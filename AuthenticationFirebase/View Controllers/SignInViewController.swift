//
//  SignInControllerViewController.swift
//  AuthenticationFirebase
//
//  Created by Daesy & Mindy on 2/24/23.

// add FirebaseApp.configure() to app delegate's didFinishLaunchingWithOptions to create a shared instance of FirebaseApp
// pass the user's email address & password to signIn()
// if the user successfully signs in the data is passed to callback method in result object

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        navigationController?.navigationBar.tintColor = UIColor(named: "medblue")
    }
    
    // uses the AuthService to process the request
    
    func checkAuth(email: String, password: String) {
       let signInRequest = SignInUserRequest(email: email, password: password)
        AuthService.shared.signIn(with: signInRequest) {
            signInError in
            if let error = signInError {
                print(error.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "signedin", sender: self)
            }
        }
    }
    
    // if spaces are empty
    
    func validateFields() -> Bool {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
            messageLabel.text = "All fields need to be filled in."
        }
        return true
    }


    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
        let validated = validateFields()
        if validated {
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            checkAuth(email: email, password: password)
        }
    }
}
