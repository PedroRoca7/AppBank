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
        bt.backgroundColor = .white
        bt.widthAnchor.constraint(equalToConstant: 50).isActive = true
        bt.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bt.clipsToBounds = true
        return bt
    }()
    
    lazy var pixLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Pix"
        element.textColor = .white
        element.font = .systemFont(ofSize: 12, weight: .medium)
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

extension CollectionCellView: ViewCodeUIView {
 
    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        self.addSubview(button)
        self.addSubview(pixLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pixLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            pixLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 2)
        ])
    }
}
