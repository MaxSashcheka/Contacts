//
//  HeaderViewButton.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/17/21.
//

import UIKit

extension UIButton {
    func setup() {
        setTitleColor(.lightGreenSea, for: .normal)
        backgroundColor = .white
        layer.shadowColor = UIColor.quarterBlack.cgColor
        layer.shadowRadius = 3
        layer.shadowOpacity = 1.0
        layer.shadowOffset = .zero
    }
    
    open override var isHighlighted: Bool {
        didSet {
            UIView.transition(with: self, duration: 0.2, options: [.transitionCrossDissolve]) { [self] in
                if isHighlighted {
                    layer.shadowRadius = 2.0
                    layer.shadowColor = UIColor.lightGreenSea.cgColor
                } else {
                    layer.shadowRadius = 1.0
                    layer.shadowColor = UIColor.quarterBlack.cgColor
                }
            }
        }
    }
}
