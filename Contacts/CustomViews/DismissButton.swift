//
//  DismissButton.swift
//  Contacts
//
//  Created by Max Sashcheka on 9/17/21.
//

import UIKit

class DismissButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setImage(UIImage(systemName: "xmark"), for: .normal)
        tintColor          = .black
        layer.cornerRadius = 17
        layer.borderWidth  = 1
        layer.borderColor  = UIColor.black.cgColor
        adjustsImageWhenHighlighted = false
        translatesAutoresizingMaskIntoConstraints = false
    }

}
