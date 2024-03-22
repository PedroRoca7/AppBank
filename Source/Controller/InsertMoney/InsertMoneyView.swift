//
//  InsertMoneyView.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/10/23.
//


import UIKit

class InsertMoneyView: UIView {
    
    // MARK: ElementsVisual
    
    lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.spacing = 10
        element.axis = .vertical
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    lazy var qrCodeButton: CustomViewHorizontalButton = {
        let element = CustomViewHorizontalButton(image: "qrCode", title: "QR Code", description: "Selecione o valor para inserir scaneando o QR code ou envie o código para alguém")
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 100).isActive = true
        element.clipsToBounds = true
        return element
    }()
    
    lazy var boletoButton: CustomViewHorizontalButton = {
        let element = CustomViewHorizontalButton(image: "pagarViaScan", title: "Boleto", description: "Gere um boleto com o valor que deseja inserir em sua conta")
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 100).isActive = true
        element.clipsToBounds = true
        return element
    }()
    
    lazy var depositTEDButton: CustomViewHorizontalButton = {
        let element = CustomViewHorizontalButton(image: "depositoPorTED", title: "Depósito por TED", description: "Visualize os dados da sua conta ou envie suas informações para alguém")
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 100).isActive = true
        element.clipsToBounds = true
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

extension InsertMoneyView: ViewCodeUIView {
    
    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        mainStackView.addArrangedSubview(qrCodeButton)
        mainStackView.addArrangedSubview(boletoButton)
        mainStackView.addArrangedSubview(depositTEDButton)
        self.addSubview(mainStackView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
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
