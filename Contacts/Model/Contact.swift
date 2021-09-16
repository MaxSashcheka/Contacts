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
    
    init(withNumberOfContacts count: Int) {
        for _ in 0..<count {
            contacts.append(Contact())
        }
    }
    
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
            "Tiah Mccarthy", "Corbin Wiggins", "Radhika Reyes", "Sachin Navarro", "Arianne Sullivan",
            "Finlay Sparks", "Daniyal Hodgson", "Eileen Peters", "Wendy Browning", "Kalum Kirby",
            "Tania Hayward", "Sunil Zuniga", "Macie Choi", "Nelly Storey", "Nathalie Bolton",
            "Marina Robertson", "Mari Mccray", "Willa Wallis", "Cynthia Pace", "Serenity Travers", "Shola Osborn",
            "Lorelai Cunningham", "Abul Roberson", "Ashlea North", "Connagh Knox", "Usaamah Morin",
            "Emilija Sandoval", "Carlos Decker", "Monet Akhtar", "Nial Whitworth"
        ]
        
        private let detailInfo = [
            "Lorem ipsum dolor","consectetur adipiscing elit", "eiusmod tempor","Purus sit amet",
            "volutpat consequat", "mauris nunc congue","Sit amet consectetur","adipiscing elit ut",
            "Sed tempus urna et","pharetra pharetra massa"
        ]
    }

}
