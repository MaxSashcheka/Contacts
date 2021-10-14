//
//  AddNewSectionViewController.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/18/21.
//

import UIKit

protocol AddNewSectionViewControllerDelegate {
    func saveNewSection(withName name: String?)
}

class AddNewSectionViewController: UIViewController, SBCardPopupContent {
    
    var delegate: AddNewSectionViewControllerDelegate?
    var popupDismisser: SBCardPopupDismisser?
    var allowsTapToDismissPopupCard = false
    var allowsSwipeToDismissPopupCard = false
    
    // MARK: - Outlets
    @IBOutlet weak var enterSectionNameLabel: UILabel!
    
    @IBOutlet weak var saveSectionButton: CustomHeaderButton!
    @IBOutlet weak var createRandomButton: CustomHeaderButton!
    
    @IBOutlet weak var sectionNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        enterSectionNameLabel.textColor = .lightGreenSea
        saveSectionButton.titleLabel?.font = UIFont.montserrat(16.0, .medium)
        createRandomButton.titleLabel?.font = UIFont.montserrat(16.0, .medium)
    }

    static func create(withDelegate delegate: AddNewSectionViewControllerDelegate) -> UIViewController {
        guard let popUpViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddNewSectionViewController") as? AddNewSectionViewController else { return UIViewController() }
        popUpViewController.delegate = delegate
        
        return popUpViewController
    }
    
    @IBAction func saveSectionButtonTapped(_ sender: Any) {
        let sectionName = sectionNameTextField.text!
        delegate?.saveNewSection(withName: sectionName)
        self.popupDismisser?.dismiss()
    }
    
    @IBAction func createRandomButtonTapped(_ sender: Any) {
        delegate?.saveNewSection(withName: nil)
        self.popupDismisser?.dismiss()
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        popupDismisser?.dismiss()
    }
    
}
