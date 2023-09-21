//
//  CellView.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

enum TypeEntry {
    case Input
    case Output
}

class CellView: UIView {
    
    // MARK: Property
    private lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.5
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var typeEntryLabel = LabelDefault(text: "Saída", color: .white, font: .boldSystemFont(ofSize: 22))
    
    lazy var aboutLabel = LabelDefault(text: "Conta de Agua", color: .white, font: .systemFont(ofSize: 16))
    
    lazy var amountLabel = LabelDefault(text: "R$ 120,00", color: .white, font: .systemFont(ofSize: 20))
    
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
        setContentView()
        setTypeEntryLabel()
        setAboutLabel()
        setAmountLabel()
    }
    
    private func setContentView() {
        self.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setTypeEntryLabel() {
        self.addSubview(typeEntryLabel)
        
        NSLayoutConstraint.activate([
            typeEntryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            typeEntryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            typeEntryLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 80)
        ])
    }
    
    private func setAboutLabel() {
        self.addSubview(aboutLabel)
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: typeEntryLabel.bottomAnchor, constant: 50),
            aboutLabel.leadingAnchor.constraint(equalTo: typeEntryLabel.leadingAnchor),
            aboutLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            aboutLabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: -25)
        ])
    }
    
    private func setAmountLabel() {
        self.addSubview(amountLabel)
        
        NSLayoutConstraint.activate([
            amountLabel.centerYAnchor.constraint(equalTo: typeEntryLabel.centerYAnchor),
            amountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 80),
            amountLabel.leadingAnchor.constraint(lessThanOrEqualTo: typeEntryLabel.trailingAnchor, constant: 120),
            amountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}


