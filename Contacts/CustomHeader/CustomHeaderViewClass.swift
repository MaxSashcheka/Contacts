//
//  CustomHeaderViewClass.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/16/21.
//

import UIKit

protocol CustomHeaderViewClassDelegate {
    func toggleSectionVisibility(forSection section: Int)
}

class CustomHeaderViewClass: UITableViewHeaderFooterView {
    
    var currentSection: Int!
    var delegate: CustomHeaderViewClassDelegate!

    static let reuseIdentifier = "CustomHeaderViewClass"
    
    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var newContactButton: UIButton!
    @IBOutlet weak var deleteButtonContact: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newContactButton.layer.cornerRadius = newContactButton.bounds.height / 4
        deleteButtonContact.layer.cornerRadius = deleteButtonContact.bounds.height / 4
    }
    
    
    @IBAction func newContactButtontapped(_ sender: Any) {
        
    }
    
    @IBAction func closeSectionButtonTapped(_ sender: UIButton) {
        delegate.toggleSectionVisibility(forSection: currentSection)
    }
    
    
    func configureWith(section: Int, delegate: CustomHeaderViewClassDelegate) {
        self.currentSection = section
        self.delegate = delegate
        
    }
    
}
