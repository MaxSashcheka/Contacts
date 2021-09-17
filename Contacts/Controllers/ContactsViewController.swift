//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/16/21.
//

import UIKit

class ContactsViewController: UIViewController {

    var contactsDataSource = [ContactsGroup]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBarSetup()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let contactNib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.register(contactNib, forCellReuseIdentifier: ContactCellClass.reuseIdentifier)
        let headerNib = UINib(nibName: "CustomHeaderView", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: CustomHeaderViewClass.reuseIdentifier)
    }
    
    private func navigationBarSetup() {
        title = "Contacts"
        
        let largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        
        let titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttributes
        navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
        
        let addNewSectionButton = CustomNavigationButton(withColor: .orange)
        addNewSectionButton.frame = CGRect(x: 0, y: 0, width: 118, height: 34)
        addNewSectionButton.setTitle("New section", for: .normal)
        addNewSectionButton.addTarget(self, action: #selector(addNewSectionButtonHandler), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addNewSectionButton)
    }
    
    @objc private func addNewSectionButtonHandler() {
        
        let newSectionIndex = contactsDataSource.count
        contactsDataSource.insert(ContactsGroup(withNumberOfContacts: 0), at: newSectionIndex)
        
        let section = IndexSet(integer: newSectionIndex)
        
        tableView.beginUpdates()
        tableView.insertSections(section, with: .left)
        tableView.endUpdates()
    }

}

//MARK: UITableViewDelegate and UITableViewDataSource

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let popup = AddUserPopUpViewController.create()
        let sbPopup = SBCardPopupViewController(contentViewController: popup)
        sbPopup.cornerRadius = 20
        sbPopup.show(onViewController: self)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderViewClass.reuseIdentifier) as? CustomHeaderViewClass else { return UIView()}
        headerView.configureWith(section: section, delegate: self, sectionName: contactsDataSource[section].sectionName)
        
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !contactsDataSource[section].isExpanded {
            return 0
        }
        return contactsDataSource[section].contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellClass.reuseIdentifier, for: indexPath)
                as? ContactCellClass else { return UITableViewCell() }
        let contact = contactsDataSource[indexPath.section].contacts[indexPath.row]
        cell.configure(withContact: contact)
        
        return cell
    }
}

//MARK: CustomHeaderViewClassDelegate

extension ContactsViewController: CustomHeaderViewClassDelegate {
    func toggleSectionVisibility(forSection section: Int) {
        
        let isSectionExpanded = contactsDataSource[section].isExpanded

        contactsDataSource[section].isExpanded = !isSectionExpanded

        var indexPathsToReload = [IndexPath]()
        for row in contactsDataSource[section].contacts.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPathsToReload.append(indexPath)
        }
        
        tableView.beginUpdates()
        if isSectionExpanded {
            tableView.deleteRows(at: indexPathsToReload, with: .fade)
        } else {
            tableView.insertRows(at: indexPathsToReload, with: .fade)
        }
        tableView.endUpdates()
        
//        tableView.beginUpdates()
//        tableView.reloadSections([section], with: .automatic)  <- Плохой вариант
//        tableView.endUpdates()
    }
    
    func createNewContact(forSection section: Int) {
        if !contactsDataSource[section].isExpanded {
            return
        }
        contactsDataSource[section].createNewContact()
        
        let indexPathToInsert = IndexPath(row: 0, section: section)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPathToInsert], with: (contactsDataSource[section].contacts.count % 2 == 1) ? .left : .right)
        tableView.endUpdates()
        
    }
}
