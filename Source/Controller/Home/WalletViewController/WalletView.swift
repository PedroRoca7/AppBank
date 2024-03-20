//
//  WalletView.swift
//  AppBank
//
//  Created by Pedro Henrique on 19/03/24.
//

import UIKit

final class WalletView: UIView {
    
    // MARK: ElementsVisual
    
    lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.spacing = 10
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    lazy var accountView: BalanceView = {
        let element = BalanceView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .white
        element.layer.cornerRadius = 10
        element.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return element
    }()
    
    lazy var insertMoneyButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "carteira")
        element.titleButtonLabel.text = "Inserir Dinheiro"
        return element
    }()
    
    lazy var payScanButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "cartão")
        element.titleButtonLabel.text = "Pagar via Scan"
        return element
    }()
    
    lazy var transferButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "carteira")
        element.titleButtonLabel.text = "Transferir"
        return element
    }()
    
    lazy var showExtractButton: CustomViewButton = {
        let element = CustomViewButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.imageButtonImageView.image = UIImage(named: "carteira")
        element.titleButtonLabel.text = "Ver extrato"
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
    
    lazy var stackViewButtons2: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.spacing = 10
        element.distribution = .fillEqually
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

extension WalletView: ViewCodeUIView {
    
    // MARK: Add Elements e Constraints
    
     func addElementsView() {
         mainStackView.addArrangedSubview(accountView)
         mainStackView.addArrangedSubview(stackViewButtons)
         mainStackView.addArrangedSubview(stackViewButtons2)
         stackViewButtons.addArrangedSubview(insertMoneyButton)
         stackViewButtons.addArrangedSubview(payScanButton)
         stackViewButtons2.addArrangedSubview(transferButton)
         stackViewButtons2.addArrangedSubview(showExtractButton)
         self.addSubview(mainStackView)
         
    }
       
     func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -10),
        ])
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .cinzaClaro
    }
}

final class BalanceView: UIView {
    
    private var showAndHideLabel: Bool = true
    
    lazy var balanceAccountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customComfortaaFont(type: .regular, size: 14)
        element.textColor = .cinzaEscuro
        element.text = "Saldo em conta"
        return element
    }()
        
    lazy var valueAccountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customComfortaaFont(type: .bold, size: 22)
        element.textColor = .azulClaro
        element.isHidden = true
        return element
    }()
    
    lazy var showAndHideBalanceButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.tintColor = .azulClaro
        element.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        element.widthAnchor.constraint(equalToConstant: 30).isActive = true
        element.heightAnchor.constraint(equalToConstant: 30).isActive = true
        element.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
        self.addSubview(balanceAccountLabel)
        self.addSubview(valueAccountLabel)
        self.addSubview(showAndHideBalanceButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            balanceAccountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            balanceAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            
            valueAccountLabel.topAnchor.constraint(equalTo: balanceAccountLabel.bottomAnchor, constant: 5),
            valueAccountLabel.leadingAnchor.constraint(equalTo: balanceAccountLabel.leadingAnchor),
            valueAccountLabel.trailingAnchor.constraint(lessThanOrEqualTo: showAndHideBalanceButton.leadingAnchor, constant: -3),
            
            showAndHideBalanceButton.centerYAnchor.constraint(equalTo: valueAccountLabel.centerYAnchor),
            showAndHideBalanceButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        ])
    }
    
    @objc private func buttonPressed() {
        showAndHideLabel.toggle()
        
        if showAndHideLabel {
            showAndHideBalanceButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            showAndHideBalanceButton.tintColor = .azulClaro
            valueAccountLabel.isHidden = true
        } else {
            showAndHideBalanceButton.setImage(UIImage(systemName: "eye"), for: .normal)
            showAndHideBalanceButton.tintColor = .azulClaro
            valueAccountLabel.isHidden = false
        }
    }
}
