//
//  UsersVC.swift
//  AndChat
//
//  Created by Petr on 09.12.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UsersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var users = [User]()
    private var selectedUsers = Dictionary<String, User>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        
        DataService.instance.usersRef.observeSingleEvent(of: .value) { (snapshot: DataSnapshot) in
            
            if let users = snapshot.value as? Dictionary<String, Any> {
                for  (key, value) in users {
                    if let dict = value as? Dictionary<String, Any> {
                        if let profile = dict["profile"] as? Dictionary<String, Any> {
                            if let firstName = profile["firstName"] as? String {
                                let uid = key
                                let user = User(uid: uid, firstName: firstName)
                                self.users.append(user)
                            }
                        }
                    }
                }
            }
            self.tableView.reloadData()
            print("users: \(self.users)")
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        cell.setCheckmark(selected: true)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = user
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        cell.setCheckmark(selected: false)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let user = users[indexPath.row]
        cell.updateUI(user: user)
        return cell
    }
    
}
