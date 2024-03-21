//
//  CustomBalanceView.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/03/24.
//

import UIKit

final class CustomBalanceView: UIView {
    
    private var showAndHideLabel: Bool = true
    
    lazy var balanceAccountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customComfortaaFont(type: .regular, size: 14)
        element.textColor = .cinzaEscuro
        element.text = "Saldo em conta"
        return element
    }()
        
    lazy var valueHideAccountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customSegoeUIFont(type: .bold, size: 22)
        element.textColor = .azulClaro
        element.isHidden = false
        element.text = "R$ *******"
        return element
    }()
    
    lazy var valueAccountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customSegoeUIFont(type: .bold, size: 22)
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
        self.addSubview(valueHideAccountLabel)
        self.addSubview(showAndHideBalanceButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            balanceAccountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            balanceAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            
            valueHideAccountLabel.topAnchor.constraint(equalTo: balanceAccountLabel.bottomAnchor, constant: 5),
            valueHideAccountLabel.leadingAnchor.constraint(equalTo: balanceAccountLabel.leadingAnchor),
            valueHideAccountLabel.trailingAnchor.constraint(lessThanOrEqualTo: showAndHideBalanceButton.leadingAnchor, constant: -3),
            
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
            valueHideAccountLabel.isHidden = false
        } else {
            showAndHideBalanceButton.setImage(UIImage(systemName: "eye"), for: .normal)
            showAndHideBalanceButton.tintColor = .azulClaro
            valueAccountLabel.isHidden = false
            valueHideAccountLabel.isHidden = true
        }
    }
}
