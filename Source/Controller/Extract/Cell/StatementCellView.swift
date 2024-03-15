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
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var typeEntryLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Saída"
        element.textColor = .red
        element.font = .boldSystemFont(ofSize: 18)
        return element
    }()
    
    lazy var aboutLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Conta de Agua"
        element.textColor = .gray
        element.font = .systemFont(ofSize: 14,weight: .medium)
        return element
    }()

    lazy var amountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "-$ 120,00"
        element.textColor = .red
        element.font = .systemFont(ofSize: 14, weight: .semibold)
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
        self.addSubview(contentView)
        self.addSubview(typeEntryLabel)
        self.addSubview(aboutLabel)
        self.addSubview(amountLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            typeEntryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            typeEntryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            typeEntryLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: typeEntryLabel.bottomAnchor, constant: 50),
            aboutLabel.leadingAnchor.constraint(equalTo: typeEntryLabel.leadingAnchor),
            aboutLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            aboutLabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            amountLabel.centerYAnchor.constraint(equalTo: typeEntryLabel.centerYAnchor),
            amountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 80),
            amountLabel.leadingAnchor.constraint(lessThanOrEqualTo: typeEntryLabel.trailingAnchor, constant: 120),
            amountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}

