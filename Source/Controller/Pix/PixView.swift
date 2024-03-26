//
//  PixView.swift
//  AppBank
//
//  Created by Pedro Henrique on 26/03/24.
//

import UIKit

final class PixView: UIView {
    
    // MARK: - ElementsVisual
    
    private lazy var headerBackground: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "backgroundHeader")
        return element
    }()
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.isLayoutMarginsRelativeArrangement = true
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 70, leading: 20, bottom: 20, trailing: 20)
        return element
    }()
    
    lazy var pixView: CustomPixView = {
        let element = CustomPixView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PixView: ViewCodeUIView {
    
    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        mainStackView.addArrangedSubview(pixView)
        self.addSubview(headerBackground)
        self.addSubview(mainStackView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: self.topAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 200),
            
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -15),
        ])
        
        let heightAnchor = mainStackView.heightAnchor.constraint(equalTo: heightAnchor)
        heightAnchor.priority = .defaultLow
        heightAnchor.isActive = true
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .cinzaClaro
    }
}
