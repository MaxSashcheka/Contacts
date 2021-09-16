//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/16/21.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Contacts"
        let textAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let contactNib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.register(contactNib, forCellReuseIdentifier: ContactCellClass.reuseIdentifier)
        
    }
    


}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellClass.reuseIdentifier, for: indexPath)
                as? ContactCellClass else { return UITableViewCell() }
        
        return cell
    }
    
    
    
    
}
