//
//  HomeViewController.swift
//  AuthenticationFirebase
//
//  Created by Mindy Douglas on 3/2/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if error == nil {
                self.performSegue(withIdentifier: "signedout", sender: self)
            }
        }
    }
}
