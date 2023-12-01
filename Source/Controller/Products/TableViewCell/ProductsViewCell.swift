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
    
    lazy var iconImageView: ImageViewDefault = {
        let iconImageView = ImageViewDefault()
        iconImageView.backgroundColor = .lilas
        iconImageView.layer.masksToBounds = true
        return iconImageView
    }()
    
    lazy var nameOptionLabel = LabelDefault(text: "", color: .darkGray, font: .boldSystemFont(ofSize: 20))
        
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
            nameOptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -50)
        ])
    }
}
