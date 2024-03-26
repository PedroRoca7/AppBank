//
//  TransfersView.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

class TransfersView: UIView {
    
    // MARK: - ElementsVisual
    
    private lazy var headerBackground: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "backgroundHeader")
        return element
    }()
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.spacing = 10
        element.axis = .vertical
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 70, leading: 20, bottom: 15, trailing: 20)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    lazy var SMSButton: CustomViewHorizontalButton = {
        let element = CustomViewHorizontalButton(image: "transferirPorSMS", title: "Via SMS", description: "Transfira dinheiro apenas com o número de celular do destinatário.")
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 100).isActive = true
        element.clipsToBounds = true
        return element
    }()
    
    lazy var currentAccountButton: CustomViewHorizontalButton = {
        let element = CustomViewHorizontalButton(image: "transferirParaConta", title: "Para conta corrente", description: "Transfira dinheiro para outra conta corrente com dados bancário e o CPF do destinatário.")
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 100).isActive = true
        element.clipsToBounds = true
        return element
    }()
    
    lazy var pixButton: CustomViewHorizontalButton = {
        let element = CustomViewHorizontalButton(image: "depositoPorTED", title: "Via Pix", description: "Transfira dinheiro para outra conta utilizando o método Pix.")
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 100).isActive = true
        element.clipsToBounds = true
        return element
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransfersView: ViewCodeUIView {
    
    // MARK: - Add Elements e Constraints
    
    func addElementsView() {
        mainStackView.addArrangedSubview(SMSButton)
        mainStackView.addArrangedSubview(currentAccountButton)
        mainStackView.addArrangedSubview(pixButton)
        self.addSubview(headerBackground)
        self.addSubview(mainStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: self.topAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 200),
            
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
        ])
        
        let heightAnchor = mainStackView.heightAnchor.constraint(equalTo: heightAnchor)
        heightAnchor.priority = .defaultLow
        heightAnchor.isActive = true
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .cinzaClaro
    }
}

