//
//  ContactDefailInfoViewController.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/18/21.
//

import UIKit

class ContactDefailInfoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactMessageLabel: UILabel!
    
    var image = UIImage()
    var name = ""
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detail Info"
        
        imageView.image = image
        contactNameLabel.text = name
        contactMessageLabel.text = message
        
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        
    }

    func configure(withContact contact: ContactsGroup.Contact) {
        image = contact.image
        name = contact.contactName
        message = contact.contactDetailInfo
    }

}
