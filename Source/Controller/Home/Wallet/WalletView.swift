//
//  WalletView.swift
//  AppBank
//
//  Created by Pedro Henrique on 19/03/24.
//

import UIKit

final class WalletView: UIView {
    
    // MARK: ElementsVisual
    
    lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.spacing = 10
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    lazy var accountView: CustomBalanceView = {
        let element = CustomBalanceView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .white
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return element
    }()
    
    lazy var insertMoneyButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "carteira")
        element.titleButtonLabel.text = "Inserir Dinheiro"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return element
    }()
    
    lazy var payScanButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "cartão")
        element.titleButtonLabel.text = "Pagar via Scan"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return element
    }()
    
    lazy var transferButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "carteira")
        element.titleButtonLabel.text = "Transferir"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return element
    }()
    
    lazy var showExtractButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "carteira")
        element.titleButtonLabel.text = "Ver extrato"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
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
    
    lazy var stackViewButtons2: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.spacing = 10
        element.distribution = .fillEqually
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

extension WalletView: ViewCodeUIView {
    
    // MARK: Add Elements e Constraints
    
     func addElementsView() {
         mainStackView.addArrangedSubview(accountView)
         mainStackView.addArrangedSubview(stackViewButtons)
         mainStackView.addArrangedSubview(stackViewButtons2)
         stackViewButtons.addArrangedSubview(insertMoneyButton)
         stackViewButtons.addArrangedSubview(payScanButton)
         stackViewButtons2.addArrangedSubview(transferButton)
         stackViewButtons2.addArrangedSubview(showExtractButton)
         self.addSubview(mainStackView)
         
    }
       
     func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -10),
        ])
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .cinzaClaro
    }
}
