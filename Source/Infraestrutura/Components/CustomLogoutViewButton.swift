//
//  CustomLogoutViewButton.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import UIKit

final class CustomLogoutViewButton: UIView {
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.spacing = 5
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 5)
        element.isLayoutMarginsRelativeArrangement = true
        element.alignment = .center
        return element
    }()
    
    private lazy var imageIcon: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "sairDaConta")
        element.widthAnchor.constraint(equalToConstant: 50).isActive = true
        element.heightAnchor.constraint(equalToConstant: 50).isActive = true
        element.contentMode = .scaleAspectFit
        return element
    }()
        
    private lazy var logoutAccountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customComfortaaFont(type: .bold, size: 16)
        element.textColor = .cinzaEscuro
        element.text = "Sair da conta"
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
        stackView.addArrangedSubview(imageIcon)
        stackView.addArrangedSubview(logoutAccountLabel)

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
