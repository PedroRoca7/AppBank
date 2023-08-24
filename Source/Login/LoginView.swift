//
//  LoginView.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class LoginView: UIView {
    
    // MARK: Property
    
    
    // MARK: ElementsVisual
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .orange
        
        return image
    }()
    
    lazy var titleLabel: LabelDefault = {
        let lb = LabelDefault(text: "Login")
        lb.font = UIFont.boldSystemFont(ofSize: 36)
        lb.textColor = .white
        
        return lb
    }()
    
    lazy var emailTextFiled: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Digite seu Email:", keyboardType: .emailAddress)
        
        return tf
    }()
    
    lazy var senhaTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Digite sua Senha:", keyboardType: .numberPad)
        
        return tf
    }()
    
    lazy var logarButton: ButtonDefault = {
        let bt = ButtonDefault(title: "Entrar",backgroundColor: .blue)
        
        return bt
    }()
    
    lazy var registratButton: ButtonDefault = {
        let bt = ButtonDefault(title: "Registrar",backgroundColor: .lightGray)
        
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
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 70),
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
        self.addSubview(senhaTextField)
        
        NSLayoutConstraint.activate([
            senhaTextField.topAnchor.constraint(equalTo: emailTextFiled.bottomAnchor, constant: 15),
            senhaTextField.leadingAnchor.constraint(equalTo: emailTextFiled.leadingAnchor),
            senhaTextField.widthAnchor.constraint(equalTo: emailTextFiled.widthAnchor),
            senhaTextField.heightAnchor.constraint(equalTo: emailTextFiled.heightAnchor)
        ])
    }
    
    private func setLogarButton() {
        self.addSubview(logarButton)
        
        NSLayoutConstraint.activate([
            logarButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logarButton.topAnchor.constraint(equalTo: senhaTextField.bottomAnchor, constant: 60),
            logarButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setRegistratButton() {
        self.addSubview(registratButton)
        
        NSLayoutConstraint.activate([
            registratButton.centerXAnchor.constraint(equalTo: logarButton.centerXAnchor),
            registratButton.topAnchor.constraint(equalTo: logarButton.bottomAnchor, constant: 30),
            registratButton.widthAnchor.constraint(equalToConstant: 170),
            registratButton.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 150)
            
        ])
    }
}
