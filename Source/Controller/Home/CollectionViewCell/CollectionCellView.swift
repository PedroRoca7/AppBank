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
    
    lazy var imageButton: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.widthAnchor.constraint(equalToConstant: 50).isActive = true
        element.heightAnchor.constraint(equalToConstant: 50).isActive = true
        element.clipsToBounds = true
        element.contentMode = .scaleAspectFit
        return element
    }()
    
    lazy var buttonTitleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = ""
        element.textColor = .white
        element.font = .customSegoeUIFont(type: .bold, size: 12)
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
        self.addSubview(imageButton)
        self.addSubview(buttonTitleLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            buttonTitleLabel.centerXAnchor.constraint(equalTo: imageButton.centerXAnchor),
            buttonTitleLabel.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 2)
        ])
    }
}
