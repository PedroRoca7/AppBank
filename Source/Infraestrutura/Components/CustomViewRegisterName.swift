//
//  CustomViewRegister.swift
//  AppBank
//
//  Created by Pedro Henrique on 14/03/24.
//

import UIKit

final class CustomViewRegisterName: UIView {
    
    lazy var backButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        element.tintColor = .azulClaro
        element.widthAnchor.constraint(equalToConstant: 30).isActive = true
        element.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return element
    }()
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .center
        element.spacing = 20
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 10, trailing: 15)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    private lazy var iconeRegisterImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "registerIcone")
        element.widthAnchor.constraint(equalToConstant: 80).isActive = true
        element.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        return element
    }()
    
    private lazy var emailLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Nome"
        element.textColor = .cinzaEscuro
        element.font = .customComfortaaFont(type: .bold, size: 30)
        return element
    }()
    
    private lazy var letsStartLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Vamos começar"
        element.textColor = .cinzaEscuro
        element.font = .customComfortaaFont(type: .regular, size: 20)
        return element
    }()
    
    private lazy var whatsYoursEmailLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Qual é o seu nome?"
        element.textColor = .cinzaEscuro
        element.font = .customComfortaaFont(type: .regular, size: 20)
        return element
    }()
    
    lazy var nameTextField: TextFieldDefault = {
        let element = TextFieldDefault(placeholder: "Pedro Henrique", keyboardType: .default, backgroundColor: .clear, typeTextField: .onlyLine)
        element.textColor = .cinzaEscuro
        element.font = .customSegoeUIFont(type: .regular, size: 16)
        element.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return element
    }()
    
    lazy var continueButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setTitle("continuar", for: .normal)
        element.backgroundColor = .azulClaro
        element.titleLabel?.font = .customComfortaaFont(type: .bold, size: 16)
        element.layer.cornerRadius = 10
        element.widthAnchor.constraint(equalToConstant: 200).isActive = true
        element.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        setupConstraints()
        setupCustomSpacingStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        stackView.addArrangedSubview(iconeRegisterImage)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(letsStartLabel)
        stackView.addArrangedSubview(whatsYoursEmailLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(continueButton)
        addSubview(stackView)
        addSubview(backButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
        ])
    }
    
    private func setupCustomSpacingStackView() {
        stackView.setCustomSpacing(5, after: letsStartLabel)
    }
}
