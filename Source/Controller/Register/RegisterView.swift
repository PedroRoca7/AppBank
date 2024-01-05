//
//  RegisterView.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class RegisterView: UIView {
    
    // MARK: Property
    
    lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var logoImageView = ImageViewDefault(nameImage: "LogoAppBank")
    lazy var titleLabel = LabelDefault(text: "Create your Account", color: .black, font: .systemFont(ofSize: 14, weight: .semibold))
    
    lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    
    lazy var nameTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Name", keyboardType: .default, backgroundColor: .white, typeTextField: .standard)
        tf.layer.cornerRadius = 5
        tf.widthAnchor.constraint(equalToConstant: 320).isActive = true
        return tf
    }()
    
    lazy var emailTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Email", keyboardType: .emailAddress, backgroundColor: .white, typeTextField: .standard)
        tf.layer.cornerRadius = 5
        tf.widthAnchor.constraint(equalToConstant: 320).isActive = true
        return tf
    }()
    
    lazy var passwordTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Password", keyboardType: .numberPad, backgroundColor: .white, typeTextField: .standard)
        tf.widthAnchor.constraint(equalToConstant: 320).isActive = true
        tf.layer.cornerRadius = 5
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var signInButton = ButtonDefault(title: "sign in", backgroundColor: .lilas)
    lazy var orSignInLabel = LabelDefault(text: "Or sign in with", color: .lightGray, font: .systemFont(ofSize: 12, weight: .medium))
    
    lazy var socialMediaButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [googleButton, facebookButton, twitterButton])
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
        setTextfieldStackView()
        setSignInButton()
        setOrSignInLabel()
        setSocialMediaButtonsStackView()
    }
    
    private func setLogoImageView() {
        self.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.guide.topAnchor, constant: 10),
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
    
    private func setTextfieldStackView() {
        self.addSubview(textFieldStackView)
        
        NSLayoutConstraint.activate([
            textFieldStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textFieldStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textFieldStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    private func setSignInButton() {
        self.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 40),
            signInButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 320),
            signInButton.heightAnchor.constraint(equalToConstant: 35)
            
        ])
    }
    
    private func setOrSignInLabel() {
        self.addSubview(orSignInLabel)
        
        NSLayoutConstraint.activate([
            orSignInLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 45),
            orSignInLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setSocialMediaButtonsStackView() {
        self.addSubview(socialMediaButtonsStackView)
        
        NSLayoutConstraint.activate([
            socialMediaButtonsStackView.topAnchor.constraint(equalTo: orSignInLabel.bottomAnchor, constant: 10),
            socialMediaButtonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            socialMediaButtonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            socialMediaButtonsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
