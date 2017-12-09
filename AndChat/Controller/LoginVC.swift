//
//  LoginVC.swift
//  AndChat
//
//  Created by Petr on 06.12.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func loginPressed(_ sender: Any) {
        
        if let email = emailField.text, let pass = passwordField.text , (email.count > 5 && pass.count > 0 && email.contains("@")) {

            AuthService.instance.login(email: email, password: pass, onComplete: { (errMsg, data) in
                guard errMsg == nil else {
                    let alert = UIAlertController(title: "Error Authentication", message: errMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            })
        
        } else {
            let alert = UIAlertController(title: "Username and Password required", message: "You must enter both a username and a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil
            ))
            present(alert, animated: true, completion: nil)
        }
    }
    
}
