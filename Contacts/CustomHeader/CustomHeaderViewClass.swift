//
//  CustomHeaderViewClass.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/16/21.
//

import UIKit

protocol CustomHeaderViewClassDelegate {
    func toggleSectionVisibility(forSection section: Int)
    func createNewContact(forSection section: Int)
}

class CustomHeaderViewClass: UITableViewHeaderFooterView {
    
    var currentSection: Int!
    var delegate: CustomHeaderViewClassDelegate!

    static let reuseIdentifier = "CustomHeaderViewClass"
    
    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var newContactButton: UIButton!
    @IBOutlet weak var closeExpandButton: UIButton!
    
    var isExpanded = true
    
    @IBAction func newContactButtontapped(_ sender: Any) {
        delegate.createNewContact(forSection: currentSection)
    }

    @IBAction func closeExpandSectionButtonTapped(_ sender: UIButton) {
        isExpanded = !isExpanded
        if isExpanded {
            sender.setTitle("Close section", for: .normal)
        } else {
            sender.setTitle("Expand section", for: .normal)
        }
        delegate.toggleSectionVisibility(forSection: currentSection)
    }
    
    func configureWith(section: Int, delegate: CustomHeaderViewClassDelegate, sectionName: String) {
        self.currentSection = section
        self.delegate = delegate
        self.sectionNameLabel.text = "Section: \(sectionName)"
        
    }
    
}
