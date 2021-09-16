//
//  CustomHeaderViewClass.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/16/21.
//

import UIKit

class CustomHeaderViewClass: UITableViewHeaderFooterView {

    static let reuseIdentifier = "CustomHeaderViewClass"
    
    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var newContactButton: UIButton!
    @IBOutlet weak var deleteButtonContact: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newContactButton.layer.cornerRadius = newContactButton.bounds.height / 4
        deleteButtonContact.layer.cornerRadius = deleteButtonContact.bounds.height / 4
    }
    
    
    
}
