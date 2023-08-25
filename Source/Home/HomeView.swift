//
//  HomeView.swift
//  Itubers
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

class HomeView: UIView {
    
    // MARK: Property
    
    private lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.backgroundColor = .orange
        return image
    }()
    
    lazy var viewBalance: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var subViewBalance: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.alpha = 0.5
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var balanceLabel = LabelDefault(text: "Saldo", color: .white, font: .boldSystemFont(ofSize: 18))
    
    lazy var amountLabel = LabelDefault(text: "R$ 1.000,00", color: .white, font: .boldSystemFont(ofSize: 26))
    
    lazy var hideAmountButton: ButtonDefault = {
        let bt = ButtonDefault()
        bt.setImage(UIImage(named: "eyeShow"), for: .normal)
        bt.layer.borderWidth = 0
        return bt
    }()
    
    lazy var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .plain)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tb
    }()
    
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
        setBackgroundImage()
        setSubViewBalance()
        setViewBalance()
        setBalanceLabel()
        setAmountLabel()
        setHideAmountButton()
        setTableView()
    }
    
    private func setBackgroundImage() {
        self.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setViewBalance() {
        self.addSubview(viewBalance)
        
        NSLayoutConstraint.activate([
            viewBalance.topAnchor.constraint(equalTo: self.guide.topAnchor, constant: 20),
            viewBalance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            viewBalance.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            viewBalance.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setSubViewBalance() {
        self.addSubview(subViewBalance)
        
        NSLayoutConstraint.activate([
            subViewBalance.topAnchor.constraint(equalTo: self.guide.topAnchor, constant: 20),
            subViewBalance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            subViewBalance.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            subViewBalance.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setBalanceLabel() {
        viewBalance.addSubview(balanceLabel)
        
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: viewBalance.topAnchor, constant: 35),
            balanceLabel.leadingAnchor.constraint(equalTo: viewBalance.leadingAnchor, constant: 20),
            balanceLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30)
        ])
    }
    
    private func setAmountLabel() {
        viewBalance.addSubview(amountLabel)
        
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 10),
            amountLabel.leadingAnchor.constraint(equalTo: balanceLabel.leadingAnchor),
            amountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
    
    private func setHideAmountButton() {
        viewBalance.addSubview(hideAmountButton)
        
        NSLayoutConstraint.activate([
            hideAmountButton.centerYAnchor.constraint(equalTo: balanceLabel.centerYAnchor),
            hideAmountButton.leadingAnchor.constraint(equalTo: balanceLabel.trailingAnchor, constant: 10),
            hideAmountButton.widthAnchor.constraint(equalToConstant: 30),
            hideAmountButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    private func setTableView() {
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: viewBalance.bottomAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
