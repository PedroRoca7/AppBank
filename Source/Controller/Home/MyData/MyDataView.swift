//
//  MyDataView.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import UIKit

final class MyDataView: UIView {
    // MARK: ElementsVisual
    
    lazy var mainStackView: SimpleScrollView = {
        let element = SimpleScrollView(spacing: 10, margins: .init(top: 15,
                                                                   leading: 20,
                                                                   bottom: 15,
                                                                   trailing: 20))
        element.translatesAutoresizingMaskIntoConstraints = false
        
        return element
    }()
        
    lazy var stackViewButtons: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.spacing = 10
        element.distribution = .fillEqually
        return element
    }()

    lazy var myDataButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "meusDados")
        element.titleButtonLabel.text = "Meus dados"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return element
    }()
    
    lazy var changePassword: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "mudarSenha")
        element.titleButtonLabel.text = "Mudar senha"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return element
    }()
        
    lazy var stackViewButtons2: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.spacing = 10
        element.distribution = .fillEqually
        return element
    }()
    
    lazy var configButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "configuracoes")
        element.titleButtonLabel.text = "Configurações"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return element
    }()
    
    lazy var supportButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "atendimento")
        element.titleButtonLabel.text = "Atendimento"
        element.imageButtonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        element.imageButtonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return element
    }()
    
    lazy var blockedCardView: CustomLogoutViewButton = {
        let element = CustomLogoutViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .white
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return element
    }()
        
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyDataView: ViewCodeUIView {
    
    // MARK: Add Elements e Constraints
    
     func addElementsView() {
         mainStackView.addSubview(stackViewButtons)
         stackViewButtons.addArrangedSubview(myDataButton)
         stackViewButtons.addArrangedSubview(changePassword)
         mainStackView.addSubview(stackViewButtons2)
         stackViewButtons2.addArrangedSubview(configButton)
         stackViewButtons2.addArrangedSubview(supportButton)
         mainStackView.addSubview(blockedCardView)
         
         self.addSubview(mainStackView)
         
    }
       
     func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
        ])
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .cinzaClaro
    }
}

