//
//  CustomMyDataView.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

final class CustomMyDataView: UIView {
    
    private var textFieldIsEnable = false
    
    private lazy var imageQRCode: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "qrCode")
        element.contentMode = .scaleAspectFit
        return element
    }()
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .leading
        element.spacing = 10
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    lazy var fullname: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Nome completo", textTextField: "Pedro Henrique", widthLineTextField: 300)
        element.titleTextField.isEnabled = textFieldIsEnable
        return element
    }()
    
    private lazy var stackViewAgencyAndAccount: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.alignment = .leading
        element.distribution = .fillProportionally
        element.spacing = 30
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    lazy var agency: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Agência", textTextField: "2604-1", widthLineTextField: 120)
        element.titleTextField.isEnabled = false
        return element
    }()
    
    lazy var account: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Conta", textTextField: "159386-7", widthLineTextField: 150)
        element.titleTextField.isEnabled = false
        return element
    }()
    
    private lazy var stackViewCpfAndPhone: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.alignment = .leading
        element.distribution = .fillProportionally
        element.spacing = 30
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    lazy var cpf: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "CPF", textTextField: "056.789.123-03", widthLineTextField: 120)
        element.titleTextField.isEnabled = textFieldIsEnable
        return element
    }()
    
    lazy var phone: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Telefone", textTextField: "(51)98758-4895", widthLineTextField: 150)
        element.titleTextField.isEnabled = textFieldIsEnable
        return element
    }()
    
    lazy var email: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "E-mail", textTextField: "Pedro@gmail.com", widthLineTextField: 300)
        element.titleTextField.isEnabled = textFieldIsEnable
        return element
    }()
    
    lazy var address: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Endereço", textTextField: "Travessa Francisco Ramos, 1026", widthLineTextField: 300)
        element.titleTextField.isEnabled = textFieldIsEnable
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
        self.addSubview(imageQRCode)
        self.addSubview(stackView)
        stackView.addArrangedSubview(fullname)
        stackView.addArrangedSubview(stackViewAgencyAndAccount)
        
        stackViewAgencyAndAccount.addArrangedSubview(agency)
        stackViewAgencyAndAccount.addArrangedSubview(account)
        
        stackView.addArrangedSubview(stackViewCpfAndPhone)
        
        stackViewCpfAndPhone.addArrangedSubview(cpf)
        stackViewCpfAndPhone.addArrangedSubview(phone)
        
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(address)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            imageQRCode.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageQRCode.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageQRCode.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: imageQRCode.bottomAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)
        ])
    }
}
