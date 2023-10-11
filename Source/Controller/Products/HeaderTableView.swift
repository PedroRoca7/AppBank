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
    }
    
    private func setCardButton() {
        self.addSubview(cardsButton)
        
        NSLayoutConstraint.activate([
            cardsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cardsButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            cardsButton.heightAnchor.constraint(equalToConstant: 60),
            cardsButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setSecurityButton() {
        self.addSubview(securityButton)
        
        NSLayoutConstraint.activate([
            securityButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            securityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            securityButton.widthAnchor.constraint(equalToConstant: 120),
            securityButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

