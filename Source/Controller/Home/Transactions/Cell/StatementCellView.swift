//
//  StatementCellView.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

enum TypeEntry {
    case Input
    case Output
}

class StatementCellView: UIView {
    
    // MARK: Property
    private lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var aboutLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Conta de Agua"
        element.textColor = .black
        element.font = .customSegoeUIFont(type: .bold, size: 18)
        return element
    }()

    lazy var amountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "-R$ 120,00"
        element.textColor = .black
        element.font = .customSegoeUIFont(type: .bold, size: 18)
        return element
    }()
    
    lazy var dateTransactionLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "10/02/2024"
        element.textColor = .cinzaEscuro
        element.font = .customSegoeUIFont(type: .bold, size: 14)
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

extension StatementCellView: ViewCodeUIView {

    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        self.addSubview(aboutLabel)
        self.addSubview(amountLabel)
        self.addSubview(dateTransactionLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            aboutLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            aboutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            aboutLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            aboutLabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: -25),
    
            amountLabel.centerYAnchor.constraint(equalTo: aboutLabel.centerYAnchor),
            amountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 80),
            amountLabel.leadingAnchor.constraint(greaterThanOrEqualTo: aboutLabel.trailingAnchor, constant: 5),
            amountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            dateTransactionLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 2),
            dateTransactionLabel.leadingAnchor.constraint(equalTo: aboutLabel.leadingAnchor),
        ])
    }
}

