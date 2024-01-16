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
    
    lazy var iconImageView = ImageViewDefault()
    lazy var nameOptionLabel = LabelDefault(text: "", color: .black, font: .boldSystemFont(ofSize: 16))
    lazy var arrowImage = ImageViewDefault(nameImage: "iconArrow")
        
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ProductsViewCell: ViewCodeUIView {
    
    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        self.addSubview(iconImageView)
        self.addSubview(nameOptionLabel)
        self.addSubview(arrowImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 35),
            iconImageView.widthAnchor.constraint(equalToConstant: 35)
        ])
    
        NSLayoutConstraint.activate([
            nameOptionLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            nameOptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            nameOptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: arrowImage.leadingAnchor, constant: -5)
        ])
       
        NSLayoutConstraint.activate([
            arrowImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
}
