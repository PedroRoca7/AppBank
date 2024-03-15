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
    
    
    lazy var titlePixLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Who would you like to make a pix for?"
        element.textColor = .black
        element.font = .boldSystemFont(ofSize: 16)
        return element
    }()
 
    lazy var nameReceivePixTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Ex: João", keyboardType: .default, backgroundColor: .white, typeTextField: .standard)
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.black.cgColor
        return tf
    }()
    
    lazy var valuePixLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Value"
        element.textColor = .black
        element.font = .boldSystemFont(ofSize: 16)
        return element
    }()
    
    lazy var valuePixTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Ex: 100", keyboardType: .default, backgroundColor: .white, typeTextField: .standard)
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.black.cgColor
        return tf
    }()
    
    lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Description"
        element.textColor = .black
        element.font = .boldSystemFont(ofSize: 16)
        return element
    }()
  
    lazy var descriptionTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Ex: Returning loan", keyboardType: .default, backgroundColor: .white, typeTextField: .standard)
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.black.cgColor
        return tf
    }()
    
    lazy var makePixButton = ButtonDefault(title: "Send Pix", backgroundColor: .azulClaro)
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScreenPixView: ViewCodeUIView {
 
    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        self.addSubview(titlePixLabel)
        self.addSubview(nameReceivePixTextField)
        self.addSubview(valuePixLabel)
        self.addSubview(valuePixTextField)
        self.addSubview(descriptionLabel)
        self.addSubview(descriptionTextField)
        self.addSubview(makePixButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titlePixLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10),
            titlePixLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            titlePixLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
        ])

        NSLayoutConstraint.activate([
            nameReceivePixTextField.topAnchor.constraint(equalTo: titlePixLabel.bottomAnchor, constant: 10),
            nameReceivePixTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            nameReceivePixTextField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
            nameReceivePixTextField.widthAnchor.constraint(equalToConstant: 250),
            nameReceivePixTextField.heightAnchor.constraint(equalToConstant: 45)
        ])

        NSLayoutConstraint.activate([
            valuePixLabel.topAnchor.constraint(equalTo: nameReceivePixTextField.bottomAnchor, constant: 10),
            valuePixLabel.leadingAnchor.constraint(equalTo: nameReceivePixTextField.leadingAnchor),
            valuePixLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
        ])
 
        NSLayoutConstraint.activate([
            valuePixTextField.topAnchor.constraint(equalTo: valuePixLabel.bottomAnchor, constant: 5),
            valuePixTextField.leadingAnchor.constraint(equalTo: valuePixLabel.leadingAnchor),
            valuePixTextField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
            valuePixTextField.widthAnchor.constraint(equalToConstant: 250),
            valuePixTextField.heightAnchor.constraint(equalToConstant: 45)
        ])

        
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: valuePixTextField.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: valuePixTextField.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
        ])

        NSLayoutConstraint.activate([
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            descriptionTextField.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            descriptionTextField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 5),
            descriptionTextField.widthAnchor.constraint(equalToConstant: 250),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 45)
        ])

        NSLayoutConstraint.activate([
            makePixButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 15),
            makePixButton.widthAnchor.constraint(equalToConstant: 100),
            makePixButton.heightAnchor.constraint(equalToConstant: 60),
            makePixButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            makePixButton.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -5)
        ])
    }
}
