//
//  ProductsViewCell.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/10/23.
//

import UIKit

class ProductsViewCell: UIView {
    
    // MARK: Property
    
    
    // MARK: ElementsVisual
    
    lazy var image = UIImageView()
    lazy var nameOptionLabel = LabelDefault(text: "", color: .white, font: .boldSystemFont(ofSize: 12))
        
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
        setImage()
        setNameOptionLabel()
    }
    
    private func setImage() {
        self.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    
    private func setNameOptionLabel() {
        self.addSubview(nameOptionLabel)
        
        NSLayoutConstraint.activate([
            nameOptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameOptionLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            nameOptionLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -50)
        ])
    }
}
