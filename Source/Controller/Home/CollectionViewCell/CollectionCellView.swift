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
        bt.titleLabel?.textAlignment = .center
        bt.layer.cornerRadius = 5
        bt.layer.borderWidth = 1
        bt.layer.borderColor = UIColor.black.cgColor
        bt.backgroundColor = .white
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bt.setTitleColor(.lilas, for: .normal)
        bt.titleLabel?.numberOfLines = 0
        bt.titleLabel?.adjustsFontSizeToFitWidth = true
        bt.titleLabel?.minimumScaleFactor = 0.5
        return bt
    }()
    
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
}

