//
//  RegisterEmailView.swift
//  AppBank
//
//  Created by Pedro Henrique on 15/03/24.
//

import Foundation
import UIKit

final class RegisterEmailView: UIView {
    
    // MARK: ElementsVisual
    
    private lazy var backgroundHeaderView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "easyBankBackground"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoHeaderView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "EasyBankLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    lazy var customView: CustomViewRegisterEmail = {
        let element = CustomViewRegisterEmail()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .white
        element.layer.cornerRadius = 20
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowOpacity = 0.5
        element.layer.shadowOffset = CGSize(width: 0, height: 4)
        element.layer.shadowRadius = 4
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

extension RegisterEmailView: ViewCodeUIView {
    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        self.addSubview(backgroundHeaderView)
        self.addSubview(logoHeaderView)
        self.addSubview(customView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundHeaderView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundHeaderView.heightAnchor.constraint(equalToConstant: 250),
            
            logoHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            logoHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            logoHeaderView.widthAnchor.constraint(equalToConstant: 100),
            logoHeaderView.heightAnchor.constraint(equalToConstant: 100),
            
            customView.topAnchor.constraint(equalTo: logoHeaderView.bottomAnchor, constant: 20),
            customView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            customView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            customView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .white
    }
}
