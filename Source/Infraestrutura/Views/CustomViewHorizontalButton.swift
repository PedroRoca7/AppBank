//
//  CustomViewHorizontalButton.swift
//  AppBank
//
//  Created by Pedro Henrique on 22/03/24.
//

import UIKit

final class CustomViewHorizontalButton: UIView {
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
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
        element.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return element
    }()
    
    private lazy var stackViewLabels: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.spacing = 5
        element.alignment = .leading
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    lazy var titleButtonLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customComfortaaFont(type: .bold, size: 16)
        element.textColor = .cinzaEscuro
        return element
    }()
    
    lazy var descriptionButtonLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customComfortaaFont(type: .bold, size: 16)
        element.textColor = .cinzaEscuro
        element.lineBreakMode = .byWordWrapping
        element.numberOfLines = 0
        return element
    }()
    
    lazy var iconArrowButton: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customComfortaaFont(type: .bold, size: 20)
        element.textColor = .cinzaEscuro
        element.text = ">"
        return element
    }()
    
    lazy var button: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    init(image: String, title: String, description: String) {
        super.init(frame: .zero)
        imageButtonImageView.image = UIImage(named: image)
        titleButtonLabel.text = title
        descriptionButtonLabel.text = description
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
        stackView.addArrangedSubview(stackViewLabels)
        stackView.addArrangedSubview(iconArrowButton)
        stackViewLabels.addArrangedSubview(titleButtonLabel)
        stackViewLabels.addArrangedSubview(descriptionButtonLabel)
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

