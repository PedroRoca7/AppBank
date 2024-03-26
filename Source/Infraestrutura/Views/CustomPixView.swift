//
//  CustomPixView.swift
//  AppBank
//
//  Created by Pedro Henrique on 26/03/24.
//

import UIKit

final class CustomPixView: UIView {
        
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
    
    lazy var recipientName: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Nome do destinatário", textTextField: "", widthLineTextField: 300)
        return element
    }()
    
    lazy var valuePix: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Valor", textTextField: "", widthLineTextField: 300)
        element.titleTextField.keyboardType = .decimalPad
        return element
    }()
    
    lazy var descriptionPix: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Descrição (opcional)", textTextField: "", widthLineTextField: 300)
        return element
    }()
    
    private lazy var entryButtonStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.distribution = .fillEqually
        return element
    }()
    
    lazy var makePixButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setTitle("enviar pix", for: .normal)
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
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(recipientName)
        stackView.addArrangedSubview(valuePix)
        stackView.addArrangedSubview(descriptionPix)
        stackView.addArrangedSubview(entryButtonStackView)
        
        entryButtonStackView.addArrangedSubview(UIView())
        entryButtonStackView.addArrangedSubview(makePixButton)
        entryButtonStackView.addArrangedSubview(UIView())
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

