//
//  RegisterToAnalyseView.swift
//  AppBank
//
//  Created by Pedro Henrique on 18/03/24.
//

import UIKit

final class RegisterToAnalyseView: UIView {
    
    private lazy var backgroundHeaderView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "backgroundRequestScreen"))
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var logoHeaderView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LogoEasyBankColor"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .center
        element.spacing = 15
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 30, trailing: 20)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    private lazy var requestCompletedLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Solicitação concluída"
        element.font = .customSegoeUIFont(type: .bold, size: 25)
        element.textColor = .white
        return element
    }()
    
    private lazy var textRequestLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Estamos analisando suas informações! Agora é só aguardar que logo entraremos em contato por e-mail. Não se preocupe que não vai demorar."
        element.font = .customSegoeUIFont(type: .regular, size: 20)
        element.textColor = .white
        element.textAlignment = .center
        element.numberOfLines = 0
        element.lineBreakMode = .byWordWrapping
        return element
    }()
    
    lazy var exitButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setTitle("sair", for: .normal)
        element.backgroundColor = .white
        element.titleLabel?.font = .customComfortaaFont(type: .bold, size: 16)
        element.setTitleColor(UIColor.azulClaro, for: .normal)
        element.layer.cornerRadius = 10
        element.widthAnchor.constraint(equalToConstant: 200).isActive = true
        element.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return element
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCustomSpacingStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterToAnalyseView: ViewCodeUIView {
    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        self.addSubview(backgroundHeaderView)
        self.addSubview(logoHeaderView)
        self.addSubview(stackView)
        stackView.addArrangedSubview(requestCompletedLabel)
        stackView.addArrangedSubview(textRequestLabel)
        stackView.addArrangedSubview(exitButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundHeaderView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundHeaderView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            logoHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            logoHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            logoHeaderView.widthAnchor.constraint(equalToConstant: 80),
            logoHeaderView.heightAnchor.constraint(equalToConstant: 80),
            
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 280),
            
        ])
    }
    
    private func setupCustomSpacingStackView() {
        stackView.setCustomSpacing(5, after: requestCompletedLabel)
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .white
    }
}
