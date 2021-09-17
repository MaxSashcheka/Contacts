//
//  PopUp.swift
//  PopUpView
//
//  Created by Max Sashcheka on 9/16/21.
//

import UIKit

class PopUp: UIView {
    
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
//        label.text = "PopUp titleLabel"
//        label.textAlignment = .center
//
//        label.numberOfLines = 3
//        return label
//    }()
//
//    private let subtitleLabel: UILabel = {
//        let subtitleLabel = UILabel()
//        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        subtitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .light)
//        subtitleLabel.text = "PopUp subtitleLabel"
//        subtitleLabel.textAlignment = .center
//
//        return subtitleLabel
//    }()
//
//    private let container: UIView = {
//        let container = UIView()
//        container.backgroundColor = .white
//        container.translatesAutoresizingMaskIntoConstraints = false
//        container.layer.cornerRadius = 24
//
//
//        container.layer.shadowRadius = 24
//        container.layer.shadowOpacity = 1
//        container.layer.shadowOffset = .zero
//        container.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
//
//        return container
//    }()
//
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [titleLabel,subtitleLabel])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//
//        return stackView
//    }()
    
    private let detailInfoView: DetailInfoView = {
        let customView = DetailInfoView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return customView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    @objc private func animateOut() {
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: [.curveEaseInOut]) {
            self.detailInfoView.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
//            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        } completion: { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc private func animateIn() {
//        self.container.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
        self.detailInfoView.transform = CGAffineTransform(translationX: 0, y: self.frame.height)

        self.alpha = 0
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: [.curveEaseInOut]) {
//            self.container.transform = .identity
            self.alpha = 1
        }
    }
    
    func setup() {
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
        
        self.addSubview(detailInfoView)
        NSLayoutConstraint.activate([
            detailInfoView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            detailInfoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            detailInfoView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            detailInfoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
        
//        container.addSubview(stackView)
//        NSLayoutConstraint.activate([
//            stackView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5),
//            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
//
//            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor)
//        ])
        animateIn()

    }
    
}
