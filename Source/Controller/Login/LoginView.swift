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
    
    lazy var backgroundImage = ImageViewDefault(nameImage: "backgroundImage")
    lazy var titleLabel = LabelDefault(text: "Login", color: .white, font: .boldSystemFont(ofSize: 36))
    lazy var emailTextFiled = TextFieldDefault(placeholder: "Digite seu Email:", keyboardType: .emailAddress)
    
    lazy var passwordTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Digite sua Senha:", keyboardType: .numberPad)
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var logarButton = ButtonDefault(title: "Entrar",backgroundColor: .lilas)
    lazy var registerButton = ButtonDefault(title: "Registrar",backgroundColor: .darkGray)
 
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
        setBackgroundImage()
        setTitleLabel()
        setEmailTextFiled()
        setSenhaTextField()
        setLogarButton()
        setRegistratButton()
    }
    
    private func setBackgroundImage() {
        self.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
        
    private func setTitleLabel() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.guide.topAnchor, constant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            titleLabel.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    private func setEmailTextFiled() {
        self.addSubview(emailTextFiled)
        
        NSLayoutConstraint.activate([
            emailTextFiled.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
            emailTextFiled.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            emailTextFiled.widthAnchor.constraint(equalToConstant: 250),
            emailTextFiled.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setSenhaTextField() {
        self.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextFiled.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextFiled.leadingAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: emailTextFiled.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextFiled.heightAnchor)
        ])
    }
    
    private func setLogarButton() {
        self.addSubview(logarButton)
        
        NSLayoutConstraint.activate([
            logarButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logarButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            logarButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setRegistratButton() {
        self.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: logarButton.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: logarButton.bottomAnchor, constant: 30),
            registerButton.widthAnchor.constraint(equalToConstant: 170),
            registerButton.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 150)
            
        ])
    }
}
