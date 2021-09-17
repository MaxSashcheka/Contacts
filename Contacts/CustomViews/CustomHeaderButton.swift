//
//  HeaderViewButton.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/17/21.
//

import UIKit

class CustomHeaderButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        setTitleColor(.lightGreenSea, for: .normal)
        backgroundColor = .white
        layer.shadowColor = UIColor.quarterBlack.cgColor
        layer.shadowRadius = 3
        layer.shadowOpacity = 1.0
        layer.shadowOffset = .zero

//        contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 21.0, bottom: 5.0, right: 21.0)
        layer.cornerRadius = 15
        
        let font = UIFont.montserrat(14.0, .medium)
        titleLabel?.font = font
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.transition(with: self, duration: 0.2, options: [.transitionCrossDissolve]) { [self] in
                if isHighlighted {
                    layer.shadowRadius = 4.0
                    layer.shadowColor = UIColor.lightGreenSea.cgColor
                } else {
                    layer.shadowRadius = 3.0
                    layer.shadowColor = UIColor.quarterBlack.cgColor
                }
            }
        }
    }
    
}
