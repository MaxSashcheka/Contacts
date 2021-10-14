//
//  CustomNavigationButton.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/17/21.
//

import UIKit

class CustomNavigationButton: UIButton {
    
    var themeColor: UIColor!
    
    init(withColor color: UIColor) {
        super.init(frame: .zero)
        themeColor = color
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        themeColor = .blue
        setup()
    }
    
    func setup() {
        setTitleColor(themeColor, for: .normal)
        backgroundColor = .white
        layer.shadowColor = UIColor.quarterBlack.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = .zero
        layer.cornerRadius = 15
        
        let font = UIFont.montserrat(14.0, .medium)
        titleLabel?.font = font
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.transition(with: self, duration: 0.2, options: [.transitionCrossDissolve]) { [self] in
                if isHighlighted {
                    layer.shadowRadius = 4.0
                    layer.shadowColor = themeColor.cgColor
                } else {
                    layer.shadowRadius = 3.0
                    layer.shadowColor = UIColor.quarterBlack.cgColor
                }
            }
        }
    }
    
}
