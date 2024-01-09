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
        addElementsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Add Elements e Constraints
    
    private func addElementsView() {
        setImage()
        setArrowImage()
        setNameOptionLabel()
    }
    
    private func setImage() {
        self.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 35),
            iconImageView.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setNameOptionLabel() {
        self.addSubview(nameOptionLabel)
        
        NSLayoutConstraint.activate([
            nameOptionLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            nameOptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            nameOptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: arrowImage.leadingAnchor, constant: -5)
        ])
    }
    
    private func setArrowImage() {
        self.addSubview(arrowImage)
        
        NSLayoutConstraint.activate([
            arrowImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
}
