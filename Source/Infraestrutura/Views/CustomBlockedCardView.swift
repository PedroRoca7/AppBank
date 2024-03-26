//
//  CustomBlockedCardView.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import UIKit

final class CustomBlockedCardView: UIView {
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.spacing = 20
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 30, leading: 5, bottom: 10, trailing: 5)
        element.isLayoutMarginsRelativeArrangement = true
        element.alignment = .center
        return element
    }()
    
    private lazy var imageIcon: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "bloquearCartao")
        element.widthAnchor.constraint(equalToConstant: 50).isActive = true
        element.heightAnchor.constraint(equalToConstant: 50).isActive = true
        element.contentMode = .scaleAspectFit
        return element
    }()
        
    private lazy var blackedCardLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customComfortaaFont(type: .bold, size: 16)
        element.textColor = .cinzaEscuro
        element.text = "Bloquear cartão"
        return element
    }()
    
    lazy var blockedCardSwitch: UISwitch = {
        let element = UISwitch()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.tintColor = .azulClaro
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
        stackView.addArrangedSubview(blackedCardLabel)
        stackView.addArrangedSubview(blockedCardSwitch)
        
        self.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func spacingSpecialStackView() {
        stackView.setCustomSpacing(5, after: imageIcon)
    }
}
