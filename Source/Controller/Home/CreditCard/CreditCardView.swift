//
//  CreditCardView.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import UIKit

final class CreditCardView: UIView {
    // MARK: ElementsVisual
    
    lazy var mainStackView: SimpleScrollView = {
        let element = SimpleScrollView(spacing: 10, margins: .init(top: 15,
                                                                   leading: 20,
                                                                   bottom: 15,
                                                                   trailing: 20))
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
        
    lazy var creditCardImage: CustomImageCreditCard = {
        let element = CustomImageCreditCard()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 150).isActive = true
        element.clipsToBounds = true
        return element
    }()
    
    lazy var blockedCardView: CustomBlockedCardView = {
        let element = CustomBlockedCardView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .white
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return element
    }()
    
    lazy var stackViewButtons: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.spacing = 10
        element.distribution = .fillEqually
        return element
    }()
    
    lazy var insertMoneyButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "cartaoVirtual")
        element.titleButtonLabel.text = "Cartão virtual"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return element
    }()
    
    lazy var payScanButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "mudarSenha")
        element.titleButtonLabel.text = "Mudar senha"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return element
    }()
        
    lazy var transactionsRecentView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 70).isActive = true
        element.backgroundColor = .white
        return element
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreditCardView: ViewCodeUIView {
    
    // MARK: Add Elements e Constraints
    
     func addElementsView() {
         mainStackView.addSubview(creditCardImage)
         mainStackView.addSubview(blockedCardView)
         mainStackView.addSubview(stackViewButtons)
         stackViewButtons.addArrangedSubview(insertMoneyButton)
         stackViewButtons.addArrangedSubview(payScanButton)
         mainStackView.addSubview(transactionsRecentView)
         self.addSubview(mainStackView)
         
    }
       
     func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
        ])
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .cinzaClaro
    }
}
