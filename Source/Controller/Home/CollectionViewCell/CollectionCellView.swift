//
//  CollectionCellView.swift
//  AppBank
//
//  Created by Pedro Henrique on 06/10/23.
//

import UIKit

class CollectionCellView: UIView {
    
    // MARK: Property
    
    // MARK: ElementsVisual
    
    lazy var button: ButtonDefault = {
        let bt = ButtonDefault()
        bt.layer.cornerRadius = bt.frame.size.width / 2
        bt.backgroundColor = .white
        bt.clipsToBounds = true
        return bt
    }()
    
    lazy var label = LabelDefault(text: "", color: .white, font: .systemFont(ofSize: 12, weight: .medium))
    
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
        setButton()
    }
    
    private func setButton() {
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
        ])
    }
    
    private func setLabel() {
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 5)
        ])
    }
}

