//
//  UserCell.swift
//  AndChat
//
//  Created by Petr on 09.12.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    
    @IBOutlet weak var firstNameLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckmark(selected: false)
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(user: User) {
        firstNameLbl.text = user.firstName
    }

    func setCheckmark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
    }
    
}
