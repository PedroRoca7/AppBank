//
//  HeaderTableView.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/10/23.
//

import UIKit

class HeaderTableView: UIView {
    
    // MARK: Property
    
    private lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var cardsButton = ButtonDefault(title: "Cartões", backgroundColor: .lilas)
    lazy var securityButton = ButtonDefault(title: "Seguros", backgroundColor: .lilas)
    lazy var investimentsButton = ButtonDefault(title: "Investimentos", backgroundColor: .lilas)
    lazy var creditButton = ButtonDefault(title: "Crédito", backgroundColor: .lilas)
    lazy var negotiationsButton = ButtonDefault(title: "Negociações", backgroundColor: .lilas)
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Add Elements e Constraints
    
    private func addElementsView() {
        setCardButton()
        setSecurityButton()
        setInvestimentsButton()
        setCreditButton()
        setNegotiationsButton()
    }
    
    private func setCardButton() {
        self.addSubview(cardsButton)
        
        NSLayoutConstraint.activate([
            cardsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            cardsButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            cardsButton.heightAnchor.constraint(equalToConstant: 60),
            cardsButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    private func setSecurityButton() {
        self.addSubview(securityButton)
        
        NSLayoutConstraint.activate([
            securityButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            securityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            securityButton.leadingAnchor.constraint(greaterThanOrEqualTo: cardsButton.trailingAnchor, constant: 5),
            securityButton.widthAnchor.constraint(equalToConstant: 140),
            securityButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setInvestimentsButton() {
        self.addSubview(investimentsButton)
        
        NSLayoutConstraint.activate([
            investimentsButton.topAnchor.constraint(equalTo: cardsButton.bottomAnchor, constant: 15),
            investimentsButton.leadingAnchor.constraint(equalTo: cardsButton.leadingAnchor),
            investimentsButton.heightAnchor.constraint(equalToConstant: 60),
            investimentsButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    private func setCreditButton() {
        self.addSubview(creditButton)
        
        NSLayoutConstraint.activate([
            creditButton.topAnchor.constraint(equalTo: securityButton.bottomAnchor, constant: 15),
            creditButton.trailingAnchor.constraint(equalTo: securityButton.trailingAnchor),
            creditButton.leadingAnchor.constraint(greaterThanOrEqualTo: investimentsButton.trailingAnchor, constant: 5),
            creditButton.heightAnchor.constraint(equalToConstant: 60),
            creditButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    private func setNegotiationsButton() {
        self.addSubview(negotiationsButton)
        
        NSLayoutConstraint.activate([
            negotiationsButton.topAnchor.constraint(equalTo: investimentsButton.bottomAnchor, constant: 15),
            negotiationsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            negotiationsButton.leadingAnchor.constraint(equalTo: cardsButton.leadingAnchor),
            negotiationsButton.trailingAnchor.constraint(equalTo: securityButton.trailingAnchor),
            negotiationsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

