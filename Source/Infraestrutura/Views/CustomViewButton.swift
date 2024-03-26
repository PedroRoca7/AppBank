//
//  CustomViewButton.swift
//  AppBank
//
//  Created by Pedro Henrique on 19/03/24.
//

import UIKit

final class CustomViewButton: UIView {
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.spacing = 5
        element.alignment = .center
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
     lazy var imageButtonImageView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .scaleAspectFit
        return element
    }()
    
     lazy var titleButtonLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customComfortaaFont(type: .bold, size: 14)
        element.textColor = .cinzaEscuro
        return element
    }()
    
    lazy var button: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        setupConstraints()
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        stackView.addArrangedSubview(imageButtonImageView)
        stackView.addArrangedSubview(titleButtonLabel)
        self.addSubview(stackView)
        self.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
