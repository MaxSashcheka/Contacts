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
    
    static func createNewContact() -> Contact {
        return Contact()
    }
    
    private let sectionNames = [
        "Friends", "Best friends", "Classmates", "Groupmates", "Old friends", "New friends"
    ]
    
    struct Contact {
        
        var image: UIImage
        var contactName: String
        var contactDetailInfo: String
        var gender: Gender
        
        private var maleImages = [UIImage]()
        private var femaleImages = [UIImage]()
        
        mutating func updateImage() {
            if gender == .male {
                image = maleImages.randomElement()!
            } else {
                image = femaleImages.randomElement()!
            }
        }
              
        init() {
            for index in 0..<16 {
                let image = UIImage(named: "student\(index)")!
                maleImages.append(image)
            }
            for index in 0..<16 {
                let image = UIImage(named: "student\(index)")!
                femaleImages.append(image)
            }
            
            let randomGenderIndex = Int.random(in: 0...1)
            gender = (randomGenderIndex == 0) ? .male : .female
            
            if gender == .male {
                image = maleImages.randomElement()!
                contactName = maleNames.randomElement()!
                contactDetailInfo = detailInfo.randomElement()!
            } else {
                image = femaleImages.randomElement()!
                contactName = femaleNames.randomElement()!
                contactDetailInfo = detailInfo.randomElement()!
            }
        }
        
        private let maleNames = [
            "Max Sashcheka", "Artem Malashkevich", "Denis Skurat", "Artem Martsev",
            "Ruslan Deminsky", "Gleb King", "Dmitri Kapchan", "Roman Pinchuk", "Evgeni Leshenko", "Nikita Gurski"
        ]
        
        private let femaleNames = [
            "Anna Kamenkova", "Natalia Morozova", "Angelina Borzdakova", "Natalie Sashcheka",
            "Nastya Tarasova", "Victoria Sobol", "Kristina Dashkevich", "Ula Shumila", "Katya Shupenik"
        ]
        
        private let detailInfo = [
            "Lorem ipsum dolor","consectetur adipiscing elit", "eiusmod tempor","Purus sit amet",
            "volutpat consequat", "mauris nunc congue","Sit amet consectetur","adipiscing elit ut",
            "Sed tempus urna et","pharetra pharetra massa"
        ]
        
        enum Gender {
            case male
            case female
        }
    }

}
