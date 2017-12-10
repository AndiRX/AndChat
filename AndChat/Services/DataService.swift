//
//  DataService.swift
//  AndChat
//
//  Created by Petr on 09.12.17.
//  Copyright © 2017 Andi. All rights reserved.
//

let FIR_CHILD_USERS = "users"

import Foundation
import FirebaseDatabase

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var usersRef: DatabaseReference {
        return mainRef.child(FIR_CHILD_USERS)
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName": "", "lastName": ""]
        mainRef.child(FIR_CHILD_USERS).child(uid).child("profile").setValue(profile)
        
    }
    
}
