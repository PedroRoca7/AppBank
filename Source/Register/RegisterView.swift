//
//  RegisterView.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class RegisterView: UIView {
    
    // MARK: Property
    
    lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .orange
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var titleLabel = LabelDefault(text: "Cadastro", color: .white, font: .boldSystemFont(ofSize: 36))
    
    lazy var nameLabel = LabelDefault(text: "Nome")
    
    lazy var nameTextField = TextFieldDefault(placeholder: "Insira seu nome")
    
    lazy var emailLabel = LabelDefault(text: "Email")
    
    lazy var emailTextField = TextFieldDefault(placeholder: "Insira seu Email", keyboardType: .emailAddress)
    
    lazy var senhaLabel = LabelDefault(text: "Senha")
    
    lazy var senhaTextField = TextFieldDefault(placeholder: "Insira sua senha")
    
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
        setNameLabel()
        setNameTextField()
        setEmailLabel()
        setEmailTextField()
        setSenhaLabel()
        setSenhaTextField()
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
            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 130)
        ])
    }
    
    private func setNameLabel() {
        self.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            nameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 80)
        ])
    }
    
    private func setNameTextField() {
        self.addSubview(nameTextField)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setEmailLabel() {
        self.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            emailLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 80)
        ])
    }
        
    private func setEmailTextField() {
        self.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setSenhaLabel() {
        self.addSubview(senhaLabel)
        
        NSLayoutConstraint.activate([
            senhaLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            senhaLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            senhaLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 80)
        ])
    }
    
    private func setSenhaTextField() {
        self.addSubview(senhaTextField)
        
        NSLayoutConstraint.activate([
            senhaTextField.topAnchor.constraint(equalTo: senhaLabel.bottomAnchor, constant: 20),
            senhaTextField.leadingAnchor.constraint(equalTo: senhaLabel.leadingAnchor),
            senhaTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}
