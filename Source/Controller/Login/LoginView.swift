//
//  LoginView.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class LoginView: UIView {
    
    // MARK: Propertys
    
    lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var logoImageView = UIImageView(image: UIImage(named: "LogoAppBank"))
    lazy var titleLabel = LabelDefault(text: "Login to your Account", color: .black, font: .systemFont(ofSize: 14, weight: .semibold))
    lazy var emailTextFiled = TextFieldDefault(placeholder: "Email", keyboardType: .emailAddress, backgroundColor: .white, typeTextField: .standard)
    
    lazy var passwordTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Password", keyboardType: .numberPad, backgroundColor: .white, typeTextField: .standard)
        tf.layer.cornerRadius = 5
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var logarButton = ButtonDefault(title: "sign in",backgroundColor: .lilas)
    lazy var orSignInLabel = LabelDefault(text: "Or sign in with", color: .lightGray, font: .systemFont(ofSize: 12, weight: .medium))
    
    lazy var stackView: UIStackView = {
        let stackView =  UIStackView(arrangedSubviews: [googleButton, facebookButton, twitterButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var googleButton: ButtonDefault = {
        let button = ButtonDefault(nameImage: "LogoGoogle")
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        return button
    }()
    
    lazy var facebookButton: ButtonDefault = {
        let button = ButtonDefault(nameImage: "LogoFacebook")
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        return button
    }()
    
    lazy var twitterButton: ButtonDefault = {
        let button = ButtonDefault(nameImage: "LogoTwitter")
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        return button
    }()
    
    lazy var dontHaveAccountLabel = LabelDefault(text: "Dont't have an account?", color: .gray, font: .systemFont(ofSize: 12, weight: .medium))
    
    lazy var signUpButton: ButtonDefault = {
        let bt = ButtonDefault(title: "Sign Up",backgroundColor: .clear)
        bt.setTitleColor(.lilas, for: .normal)
        return bt
    }()
 
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
        setLogoImageView()
        setTitleLabel()
        setEmailTextFiled()
        setSenhaTextField()
        setLogarButton()
        setOrSignInLabel()
        setStackView()
        setDontAccountLabel()
        setSignUpButton()
    }
            
    private func setLogoImageView() {
        self.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.guide.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 107),
            logoImageView.heightAnchor.constraint(equalToConstant: 107)
        ])
        
    }
    
    private func setTitleLabel() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -150)
        ])
    }
    
    private func setEmailTextFiled() {
        self.addSubview(emailTextFiled)
        emailTextFiled.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            emailTextFiled.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emailTextFiled.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextFiled.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailTextFiled.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setSenhaTextField() {
        self.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextFiled.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextFiled.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextFiled.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextFiled.heightAnchor)
        ])
    }
    
    private func setLogarButton() {
        self.addSubview(logarButton)
        
        NSLayoutConstraint.activate([
            logarButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            logarButton.leadingAnchor.constraint(equalTo: emailTextFiled.leadingAnchor),
            logarButton.trailingAnchor.constraint(equalTo: emailTextFiled.trailingAnchor),
            logarButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setOrSignInLabel() {
        self.addSubview(orSignInLabel)
        
        NSLayoutConstraint.activate([
            orSignInLabel.topAnchor.constraint(equalTo: logarButton.bottomAnchor, constant: 45),
            orSignInLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setStackView() {
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: orSignInLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setDontAccountLabel() {
        self.addSubview(dontHaveAccountLabel)
        
        NSLayoutConstraint.activate([
            dontHaveAccountLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            dontHaveAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 65)
            
        ])
    }
    
    private func setSignUpButton() {
        self.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            signUpButton.centerYAnchor.constraint(equalTo: dontHaveAccountLabel.centerYAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: dontHaveAccountLabel.trailingAnchor, constant: 5)
        ])
    }
}
