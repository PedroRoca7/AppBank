//
//  CustomViewRegisterPassword.swift
//  AppBank
//
//  Created by Pedro Henrique on 15/03/24.
//

import UIKit

final class CustomViewRegisterPassword: UIView {
    
    lazy var backButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        element.tintColor = .azulClaro
        element.widthAnchor.constraint(equalToConstant: 50).isActive = true
        element.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        element.image = UIImage(named: "key")
        element.widthAnchor.constraint(equalToConstant: 80).isActive = true
        element.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return element
    }()
    
    private lazy var passwordLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Senha"
        element.textColor = .cinzaEscuro
        element.font = .customComfortaaFont(type: .bold, size: 30)
        return element
    }()
    
    private lazy var createPasswordLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Crie uma senha para acessar o aplicativo."
        element.textColor = .cinzaEscuro
        element.font = .customComfortaaFont(type: .regular, size: 20)
        element.numberOfLines = 0
        element.lineBreakMode = .byWordWrapping
        element.textAlignment = .center
        return element
    }()
        
    private lazy var passwordStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.alignment = .leading
        element.spacing = 10
        return element
    }()
    
    lazy var passwordTextField: TextFieldDefault = {
        let element = TextFieldDefault(placeholder: "", keyboardType: .decimalPad, backgroundColor: .clear, typeTextField: .onlyLine)
        element.textColor = .cinzaEscuro
        element.font = .customSegoeUIFont(type: .regular, size: 16)
        element.isSecureTextEntry = true
        element.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return element
    }()
    
    private lazy var showOrHidePasswordButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        element.tintColor = .azulClaro
        element.widthAnchor.constraint(equalToConstant: 30).isActive = true
        element.heightAnchor.constraint(equalToConstant: 30).isActive = true
        element.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return element
    }()
    
     lazy var verifedPasswordLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Deve conter no minimo 6 caracteres."
        element.textColor = .red
        element.font = .customComfortaaFont(type: .regular, size: 16)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        stackView.addArrangedSubview(iconeRegisterImage)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(createPasswordLabel)
        stackView.addArrangedSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordTextField)
        passwordStackView.addArrangedSubview(showOrHidePasswordButton)
        stackView.addArrangedSubview(verifedPasswordLabel)
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
    
    @objc private func buttonPressed() {
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry {
            showOrHidePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            showOrHidePasswordButton.tintColor = .azulClaro
        } else {
            showOrHidePasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
            showOrHidePasswordButton.tintColor = .azulClaro
        }
    }
}

