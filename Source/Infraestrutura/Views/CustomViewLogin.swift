//
//  CustomViewLogin.swift
//  AppBank
//
//  Created by Pedro Henrique on 14/03/24.
//

import UIKit

final class CustomViewLogin: UIView {
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .leading
        element.spacing = 20
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 10, trailing: 15)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    private lazy var loginLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Login"
        element.textColor = .azulClaro
        element.font = .customComfortaaFont(type: .regular, size: 30)
        return element
    }()
    
    private lazy var userLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Usuário, e-mail ou telefone"
        element.textColor = .cinzaEscuro
        element.font = .customSegoeUIFont(type: .bold, size: 20)
        return element
    }()
    
    lazy var userTextField: TextFieldDefault = {
        let element = TextFieldDefault(placeholder: "exemplo@gmail.com", keyboardType: .emailAddress, backgroundColor: .clear, typeTextField: .onlyLine)
        element.textColor = .cinzaEscuro
        element.font = .customSegoeUIFont(type: .regular, size: 16)
        element.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return element
    }()
    
    private lazy var passwordLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Senha"
        element.textColor = .cinzaEscuro
        element.font = .customSegoeUIFont(type: .bold, size: 20)
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
    
    private lazy var entryButtonStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.distribution = .fillEqually
        return element
    }()
    
    lazy var entryButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setTitle("entrar", for: .normal)
        element.backgroundColor = .azulClaro
        element.titleLabel?.font = .customComfortaaFont(type: .bold, size: 16)
        element.layer.cornerRadius = 10
        element.widthAnchor.constraint(equalToConstant: 100).isActive = true
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
        stackView.addArrangedSubview(loginLabel)
        stackView.addArrangedSubview(userLabel)
        stackView.addArrangedSubview(userTextField)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordStackView)
        
        passwordStackView.addArrangedSubview(passwordTextField)
        passwordStackView.addArrangedSubview(showOrHidePasswordButton)
        
        stackView.addArrangedSubview(entryButtonStackView)
        
        entryButtonStackView.addArrangedSubview(UIView())
        entryButtonStackView.addArrangedSubview(entryButton)
        entryButtonStackView.addArrangedSubview(UIView())
        
        addSubview(stackView)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)
        ])
    }
    
    private func setupCustomSpacingStackView() {
        stackView.setCustomSpacing(5, after: userLabel)
        stackView.setCustomSpacing(5, after: passwordLabel)
        
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

