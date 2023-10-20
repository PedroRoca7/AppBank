//
//  ScreenPixView.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/10/23.
//


import UIKit

class ScreenPixView: UIView {
    
    // MARK: Property
    
    lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var titlePixLabel = LabelDefault(text: "Para quem você gostaria de fazer um pix?", color: .black, font: .boldSystemFont(ofSize: 16))
    lazy var nameReceivePixTextField = TextFieldDefault(placeholder: "Ex: João")
    lazy var valuePixLabel = LabelDefault(text: "Valor", color: .black, font: .systemFont(ofSize: 14))
    lazy var valuePixTextField = TextFieldDefault(placeholder: "Ex: 100")
    lazy var descriptionLabel = LabelDefault(text: "Descrição", color: .black, font: .systemFont(ofSize: 14))
    lazy var descriptionTextField = TextFieldDefault(placeholder: "Ex: Devolvendo o empréstimo")
    lazy var makePixButton = ButtonDefault(title: "Fazer Pix", backgroundColor: .blue)
    
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
        setTitlePixLabel()
        setNameReceivePixTextField()
        setValuePixLabel()
        setValuePixTextField()
        setDescriptionLabel()
        setDescriptionTextField()
        setMakePixButton()
    }
    
    private func setTitlePixLabel() {
        self.addSubview(titlePixLabel)
        
        NSLayoutConstraint.activate([
            titlePixLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10),
            titlePixLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 5),
            titlePixLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
            titlePixLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setNameReceivePixTextField() {
        self.addSubview(nameReceivePixTextField)
        
        NSLayoutConstraint.activate([
            nameReceivePixTextField.topAnchor.constraint(equalTo: titlePixLabel.topAnchor, constant: 10),
            nameReceivePixTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            nameReceivePixTextField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
            nameReceivePixTextField.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setValuePixLabel() {
        self.addSubview(valuePixLabel)
        
        NSLayoutConstraint.activate([
            valuePixLabel.topAnchor.constraint(equalTo: nameReceivePixTextField.topAnchor, constant: 10),
            valuePixLabel.leadingAnchor.constraint(equalTo: nameReceivePixTextField.leadingAnchor),
            valuePixLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
        ])
    }
    
    private func setValuePixTextField() {
        self.addSubview(valuePixTextField)
        
        NSLayoutConstraint.activate([
            valuePixTextField.topAnchor.constraint(equalTo: valuePixLabel.topAnchor, constant: 5),
            valuePixTextField.leadingAnchor.constraint(equalTo: valuePixLabel.leadingAnchor),
            valuePixTextField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
            valuePixTextField.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setDescriptionLabel() {
        self.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: valuePixTextField.topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: valuePixTextField.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
        ])
    }
    
    private func setDescriptionTextField() {
        self.addSubview(descriptionTextField)
        
        NSLayoutConstraint.activate([
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 5),
            descriptionTextField.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            descriptionTextField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
            descriptionTextField.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setMakePixButton() {
        self.addSubview(makePixButton)
        
        NSLayoutConstraint.activate([
            makePixButton.topAnchor.constraint(equalTo: descriptionTextField.topAnchor, constant: 15),
            makePixButton.widthAnchor.constraint(equalToConstant: 100),
            makePixButton.heightAnchor.constraint(equalToConstant: 60),
            makePixButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            makePixButton.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -5)
        ])
    }
}
