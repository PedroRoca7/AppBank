//
//  CustomMyDataView.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

final class CustomMyDataView: UIView {
    
    private lazy var imageQRCode: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "qrCode")
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
        let element = CustomTitleAndTextField(textTitle: "Nome completo", textTextField: "Pedro Henrique")
        return element
    }()
    
    private lazy var stackViewAgencyAndAccount: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.alignment = .leading
        element.spacing = 5
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    lazy var agency: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Agência", textTextField: "2604-1")
        return element
    }()
    
    lazy var account: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Conta", textTextField: "159386-7")
        return element
    }()
    
    private lazy var stackViewCpfAndPhone: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.alignment = .leading
        element.spacing = 5
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    lazy var cpf: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "CPF", textTextField: "056.789.123-03")
        return element
    }()
    
    lazy var phone: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Telefone", textTextField: "(51)98758-4895")
        return element
    }()
    
    lazy var email: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "E-mail", textTextField: "Pedro@gmail.com")
        return element
    }()
    
    lazy var address: CustomTitleAndTextField = {
        let element = CustomTitleAndTextField(textTitle: "Endereço", textTextField: "Travessa Francisco Ramos, 1026")
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
            
            imageQRCode.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            imageQRCode.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            imageQRCode.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            imageQRCode.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: imageQRCode.bottomAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)
        ])
    }
    
    private func setupCustomSpacingStackView() {

    }
}

final class CustomTitleAndTextField: UIStackView {
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customSegoeUIFont(type: .bold, size: 14)
        element.textColor = .azulClaro
        return element
    }()
    
    lazy var titleTextField: TextFieldDefault = {
        let element = TextFieldDefault(placeholder: "", keyboardType: .default, backgroundColor: .clear, typeTextField: .onlyLine)
        element.textColor = .black
        element.font = .customSegoeUIFont(type: .bold, size: 14)
        return element
    }()
    
    init(textTitle: String, textTextField: String) {
        super.init(frame: .zero)
        titleLabel.text = textTitle
        titleTextField.text = textTextField
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTitleAndTextField: ViewCodeUIView {
    func addElementsView() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(titleTextField)
    }
    
    func setupConstraints() {}
    
    func applyConditionSpecial() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
    }
}

