//
//  CustomImageCreditCard.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import UIKit

final class CustomImageCreditCard: UIView {
        
    private var isFlipped = true
    
    private lazy var viewCreditCard: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.clipsToBounds = true
        return element
    }()
    
    private lazy var viewBackCreditCard: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.clipsToBounds = true
        element.isHidden = true
        return element
    }()
    
    private lazy var backgroundImageCreditCard: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "backgroundCartaoCredito")
        return element
    }()

    private lazy var backgroundBackImageCreditCard: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "imageCreditCardBack")
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
        viewCreditCard.addSubview(backgroundImageCreditCard)
        viewCreditCard.addSubview(logoIcon)
        viewCreditCard.addSubview(numberCardLabel)
        viewCreditCard.addSubview(nameCardLabel)
        viewCreditCard.addSubview(validityCardLabel)
        viewCreditCard.addSubview(logoEloIcon)
        viewBackCreditCard.addSubview(backgroundBackImageCreditCard)
        self.addSubview(viewCreditCard)
        self.addSubview(viewBackCreditCard)
        self.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewCreditCard.topAnchor.constraint(equalTo: self.topAnchor),
            viewCreditCard.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewCreditCard.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewCreditCard.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            viewBackCreditCard.topAnchor.constraint(equalTo: self.topAnchor),
            viewBackCreditCard.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBackCreditCard.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewBackCreditCard.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            backgroundImageCreditCard.topAnchor.constraint(equalTo: viewCreditCard.topAnchor),
            backgroundImageCreditCard.leadingAnchor.constraint(equalTo: viewCreditCard.leadingAnchor),
            backgroundImageCreditCard.trailingAnchor.constraint(equalTo: viewCreditCard.trailingAnchor),
            backgroundImageCreditCard.bottomAnchor.constraint(equalTo: viewCreditCard.bottomAnchor),
            
            backgroundBackImageCreditCard.topAnchor.constraint(equalTo: viewBackCreditCard.topAnchor),
            backgroundBackImageCreditCard.leadingAnchor.constraint(equalTo: viewBackCreditCard.leadingAnchor),
            backgroundBackImageCreditCard.trailingAnchor.constraint(equalTo: viewBackCreditCard.trailingAnchor),
            backgroundBackImageCreditCard.bottomAnchor.constraint(equalTo: viewBackCreditCard.bottomAnchor),
            
            logoIcon.topAnchor.constraint(equalTo: viewCreditCard.topAnchor, constant: 5),
            logoIcon.leadingAnchor.constraint(equalTo: viewCreditCard.leadingAnchor, constant: 5),
            
            numberCardLabel.topAnchor.constraint(equalTo: logoIcon.bottomAnchor, constant: 20),
            numberCardLabel.leadingAnchor.constraint(equalTo: logoIcon.leadingAnchor),
            numberCardLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewCreditCard.trailingAnchor, constant: -5),
            
            nameCardLabel.topAnchor.constraint(equalTo: numberCardLabel.bottomAnchor, constant: 5),
            nameCardLabel.leadingAnchor.constraint(equalTo: numberCardLabel.leadingAnchor),
            nameCardLabel.trailingAnchor.constraint(equalTo: validityCardLabel.leadingAnchor, constant: -5),
            
            validityCardLabel.centerYAnchor.constraint(equalTo: nameCardLabel.centerYAnchor),
            validityCardLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewCreditCard.trailingAnchor, constant: -5),
            
            logoEloIcon.trailingAnchor.constraint(equalTo: viewCreditCard.trailingAnchor, constant: -3),
            logoEloIcon.bottomAnchor.constraint(equalTo: viewCreditCard.bottomAnchor, constant: -3),
            
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        backgroundBackImageCreditCard.frame = backgroundImageCreditCard.frame
        backgroundBackImageCreditCard.layer.cornerRadius = backgroundImageCreditCard.layer.cornerRadius
        
    }
    
    @objc private func buttonPressed() {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromLeft, .showHideTransitionViews]
        
        if isFlipped {
            UIView.transition(from: viewCreditCard, to: viewBackCreditCard, duration: 0.5, options: transitionOptions)
            viewCreditCard.isHidden = true
            viewBackCreditCard.isHidden = false
        } else {
            UIView.transition(from: viewBackCreditCard, to: viewCreditCard, duration: 0.5, options: transitionOptions)
            viewCreditCard.isHidden = false
            viewBackCreditCard.isHidden = true
        }
        isFlipped.toggle()
    }
}
