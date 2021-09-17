//
//  AddUserPopUpViewController.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/17/21.
//

import UIKit

protocol AddUserPopUpViewControllerDelegate {
    func saveNewContact(contact: ContactsGroup.Contact, forSection section: Int)
}

class AddUserPopUpViewController: UIViewController, SBCardPopupContent {
    
    
    var popupDismisser: SBCardPopupDismisser?
    var allowsTapToDismissPopupCard = true
    var allowsSwipeToDismissPopupCard = true
    
    var currentSection: Int!
    var delegate: AddUserPopUpViewControllerDelegate!
    
    // MARK: - Outlets
    @IBOutlet weak var enterContactLabel: UILabel!
    @IBOutlet weak var enterContactMessageLabel: UILabel!
    
    @IBOutlet weak var contactNameTextField: UITextField!
    @IBOutlet weak var contactMessageTextField: UITextField!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var saveContactButton: CustomHeaderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterContactLabel.textColor = .lightGreenSea
        enterContactMessageLabel.textColor = .lightGreenSea
        
        genderSegmentedControl.selectedSegmentTintColor = .lightGreenSea
        
    }
    
    static func create(forSection section: Int,withDelegate delegate: AddUserPopUpViewControllerDelegate) -> UIViewController {
        guard let popUpViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddUserPopUpViewController") as? AddUserPopUpViewController else { return UIViewController() }
        
        popUpViewController.currentSection = section
        popUpViewController.delegate = delegate
        
        
        return popUpViewController
    }
    
    
    @IBAction func saveContact(_ sender: Any) {
        var contact = ContactsGroup.createNewContact()
        
        contact.contactName = contactNameTextField.text ?? "No name"
        contact.contactDetailInfo = contactMessageTextField.text ?? "No message"

        delegate.saveNewContact(contact: contact, forSection: currentSection)
        self.popupDismisser?.dismiss()
    }
    

}
