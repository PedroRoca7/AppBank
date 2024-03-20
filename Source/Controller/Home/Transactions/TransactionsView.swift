//
//  TransactionsView.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/03/24.
//

import Foundation
import UIKit

final class TransactionsView: UIView {
    
    // MARK: ElementsVisual
    
    lazy var stackViewButtons: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.distribution = .fillEqually
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        element.isLayoutMarginsRelativeArrangement = true
        element.spacing = 5
        return element
    }()
    
    lazy var insertMoneyButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "carteira")
        element.titleButtonLabel.text = "Inserir Dinheiro"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        element.titleButtonLabel.font = .customComfortaaFont(type: .bold, size: 10)
        element.titleButtonLabel.lineBreakMode = .byWordWrapping
        element.titleButtonLabel.numberOfLines = 0
        element.titleButtonLabel.textAlignment = .center
        return element
    }()
    
    lazy var payScanButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "cartão")
        element.titleButtonLabel.text = "Pagar via Scan"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        element.titleButtonLabel.font = .customComfortaaFont(type: .bold, size: 10)
        element.titleButtonLabel.lineBreakMode = .byWordWrapping
        element.titleButtonLabel.numberOfLines = 0
        element.titleButtonLabel.textAlignment = .center
        return element
    }()
    
    lazy var transferButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "carteira")
        element.titleButtonLabel.text = "Transferir"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        element.titleButtonLabel.font = .customComfortaaFont(type: .bold, size: 10)
        element.titleButtonLabel.lineBreakMode = .byWordWrapping
        element.titleButtonLabel.numberOfLines = 0
        element.titleButtonLabel.textAlignment = .center
        return element
    }()
    
    lazy var showExtractButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "carteira")
        element.titleButtonLabel.text = "Ver extrato"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        element.titleButtonLabel.font = .customComfortaaFont(type: .bold, size: 10)
        element.titleButtonLabel.lineBreakMode = .byWordWrapping
        element.titleButtonLabel.numberOfLines = 0
        element.titleButtonLabel.textAlignment = .center
        return element
    }()
    
    lazy var tableView: UITableView = {
        let element = UITableView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.register(CustomStatementTableViewCell.self, forCellReuseIdentifier: CustomStatementTableViewCell.identifier)
        element.rowHeight = 70
        element.estimatedRowHeight = 70
        element.backgroundColor = .white
        element.layer.cornerRadius = 10
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

extension TransactionsView: ViewCodeUIView {
    
    // MARK: Add Elements e Constraints
    
     func addElementsView() {
         stackViewButtons.addArrangedSubview(insertMoneyButton)
         stackViewButtons.addArrangedSubview(payScanButton)
         stackViewButtons.addArrangedSubview(transferButton)
         stackViewButtons.addArrangedSubview(showExtractButton)
         self.addSubview(stackViewButtons)
         self.addSubview(tableView)
         
    }
       
     func setupConstraints() {
        NSLayoutConstraint.activate([
            stackViewButtons.topAnchor.constraint(equalTo: self.topAnchor),
            stackViewButtons.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackViewButtons.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackViewButtons.heightAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: stackViewButtons.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
        ])
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .cinzaClaro
    }
}
