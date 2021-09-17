//
//  AddUserPopUpViewController.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/17/21.
//

import UIKit

class AddUserPopUpViewController: UIViewController, SBCardPopupContent {
    
    var popupDismisser: SBCardPopupDismisser?
    var allowsTapToDismissPopupCard = true
    var allowsSwipeToDismissPopupCard = true
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    static func create() -> UIViewController {
        guard let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddUserPopUpViewController") as? AddUserPopUpViewController else { return UIViewController() }
        
        return storyboard
    }


}
