//
//  CustomImageCreditCard.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import UIKit

final class CustomImageCreditCard: UIView {
        
    private lazy var backgroundImageCreditCard: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "backgroundCartaoCredito")
        return element
    }()

    private lazy var logoIcon: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "EasyBankLogo")
        element.widthAnchor.constraint(equalToConstant: 30).isActive = true
        element.heightAnchor.constraint(equalToConstant: 30).isActive = true
        element.contentMode = .scaleAspectFit
        return element
    }()
        
    private lazy var numberCardLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customSegoeUIFont(type: .bold, size: 18)
        element.textColor = .white
        element.text = "5535  ****  ****  2296"
        return element
    }()
    
    lazy var nameCardLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customSegoeUIFont(type: .bold, size: 16)
        element.textColor = .white
        element.text = "PEDRO"
        return element
    }()
    
    private lazy var validityCardLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customSegoeUIFont(type: .bold, size: 16)
        element.textColor = .white
        element.text = "12/28"
        return element
    }()

    private lazy var logoEloIcon: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "logoELO")
        element.widthAnchor.constraint(equalToConstant: 80).isActive = true
        element.heightAnchor.constraint(equalToConstant: 30).isActive = true
        element.contentMode = .scaleAspectFit
        return element
    }()
    
    lazy var button: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        setupConstraints()
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        self.addSubview(backgroundImageCreditCard)
        self.addSubview(logoIcon)
        self.addSubview(numberCardLabel)
        self.addSubview(nameCardLabel)
        self.addSubview(validityCardLabel)
        self.addSubview(logoEloIcon)
        self.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageCreditCard.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageCreditCard.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageCreditCard.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageCreditCard.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            logoIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            logoIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            
            numberCardLabel.topAnchor.constraint(equalTo: logoIcon.bottomAnchor, constant: 20),
            numberCardLabel.leadingAnchor.constraint(equalTo: logoIcon.leadingAnchor),
            numberCardLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -5),
            
            nameCardLabel.topAnchor.constraint(equalTo: numberCardLabel.bottomAnchor, constant: 5),
            nameCardLabel.leadingAnchor.constraint(equalTo: numberCardLabel.leadingAnchor),
            nameCardLabel.trailingAnchor.constraint(equalTo: validityCardLabel.leadingAnchor, constant: -5),
            
            validityCardLabel.centerYAnchor.constraint(equalTo: nameCardLabel.centerYAnchor),
            validityCardLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -5),
            
            logoEloIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            logoEloIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3),
            
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
    @objc private func buttonPressed() {
        var backgroundBackImageCreditCard = UIImageView()
        backgroundBackImageCreditCard = UIImageView(image: backgroundImageCreditCard.image)
        backgroundBackImageCreditCard.frame = backgroundImageCreditCard.frame
        backgroundBackImageCreditCard.layer.cornerRadius = backgroundImageCreditCard.layer.cornerRadius
        backgroundBackImageCreditCard.layer.masksToBounds = true
        backgroundBackImageCreditCard.layer.transform = CATransform3DMakeRotation(CGFloat.pi, 0.0, 1.0, 0.0)
        self.addSubview(backgroundBackImageCreditCard)
        
        UIView.transition(from: backgroundImageCreditCard, to: backgroundBackImageCreditCard, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
    }
}
