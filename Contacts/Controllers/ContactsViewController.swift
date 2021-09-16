//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/16/21.
//

import UIKit

class ContactsViewController: UIViewController {

    var contactsDataSource = [
        [Contact(),Contact(),Contact(),Contact(),Contact()],
        [Contact(),Contact()],
        [Contact(),Contact(),Contact()],
        [Contact(),Contact(),Contact(),Contact(),Contact(),Contact()]
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Contacts"
        let textAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let contactNib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.register(contactNib, forCellReuseIdentifier: ContactCellClass.reuseIdentifier)
        let headerNib = UINib(nibName: "CustomHeaderView", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: CustomHeaderViewClass.reuseIdentifier)
    }
    


}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderViewClass.reuseIdentifier) as? CustomHeaderViewClass else { return UIView()}
        
        
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsDataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellClass.reuseIdentifier, for: indexPath)
                as? ContactCellClass else { return UITableViewCell() }
        let contact = contactsDataSource[indexPath.section][indexPath.row]
        cell.configure(withContact: contact)
        
        return cell
    }
    
    
    
    
}
