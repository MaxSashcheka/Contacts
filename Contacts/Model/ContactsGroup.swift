//
//  Contact.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/16/21.
//

import UIKit

struct ContactsGroup {
    
    var isExpanded = true
    var contacts = [Contact]()
    var sectionName: String
    
    init(withNumberOfContacts count: Int) {
        for _ in 0..<count {
            contacts.append(Contact())
        }
        
        let randomSectionNameIndex = Int.random(in: 0..<sectionNames.count)
        sectionName = sectionNames[randomSectionNameIndex]
        
    }
    
    mutating func createNewContact() {
        let newContact = Contact()
        contacts.insert(newContact, at: 0)
    }
    
    private let sectionNames = [
        "Friends", "Best friends", "Classmates", "Groupmates", "Old friends", "New friends"
    ]
    
    struct Contact {
        
        var image: UIImage
        var contactName: String
        var contactDetailInfo: String
        
        init() {
            let randomImageIndex = Int.random(in: 0..<16)
            image = UIImage(named: "image\(randomImageIndex)")!
        
            let randomContactNameIndex = Int.random(in: 0..<names.count)
            contactName = names[randomContactNameIndex]
            
            let randomDeatilInfoIndex = Int.random(in: 0..<detailInfo.count)
            contactDetailInfo = detailInfo[randomDeatilInfoIndex]
        }
        
        private let names = [
            "Max Sashcheka", "Artem Malashkevich", "Denis Skuarat", "Artem Martsev", "Anna Kamenkova",
            "Ruslan Deminsky", "Gleb King", "Dmitri Kapchan", "Roman Pinchuk", "Natalia Morozova",
            "Angelina Borzdakova", "Evgeni Leshenko", "Nikita Gurski"
        ]
        
        private let detailInfo = [
            "Lorem ipsum dolor","consectetur adipiscing elit", "eiusmod tempor","Purus sit amet",
            "volutpat consequat", "mauris nunc congue","Sit amet consectetur","adipiscing elit ut",
            "Sed tempus urna et","pharetra pharetra massa"
        ]
    }

}
