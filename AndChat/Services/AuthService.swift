//
//  AuthService.swift
//  AndChat
//
//  Created by Petr on 09.12.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import Foundation
import Firebase

typealias Completion = (_ errMsg: String?, _ data: Any?) -> Void

class AuthService {
    
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: (error!._code)) {
                    if errorCode == .userNotFound {
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                
                            } else {
                                if user?.uid != nil {
                                    DataService.instance.saveUser(uid: user!.uid)
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                        self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                        } else {
                                            onComplete?(nil, user)                                        }
                                    })
                                }
                            }
                        })
                    } else {
                        self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)                    }
                    
                }
            } else {
                onComplete?(nil, user)
            }
        }
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            switch errorCode {
            case .invalidEmail:
                onComplete?("Invalid email address", nil)
            case .wrongPassword:
                onComplete?("Invalid password", nil)
            case .emailAlreadyInUse, .accountExistsWithDifferentCredential:
                onComplete?("Could not create account. eMail already in use.", nil)
            default:
                onComplete?("There was a  problem authenticating. Please try again!", nil)
            }
        }
    }
}
