//
//  ContactCell.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/16/21.
//

import UIKit

class ContactCellClass: UITableViewCell {

    static let reuseIdentifier = "ContactCellClass"
    
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var detailInfoLabel: UILabel!
    

    
    func configure(withContact contact: ContactsGroup.Contact) {
        contactImageView.image = contact.image
        userNameLabel.text = contact.contactName
        detailInfoLabel.text = contact.contactDetailInfo
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contactImageView.clipsToBounds = true
        contactImageView.layer.cornerRadius = contactImageView.bounds.height / 2
    }
    
}
