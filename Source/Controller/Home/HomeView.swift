//
//  HomeView.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

class HomeView: UIView {
    
    // MARK: Property
    
    private lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var backgroundImage = ImageViewDefault(nameImage: "backgroundImage")
    lazy var viewBalance = ViewDefault(backgroundColor: .white, alpha: 0.7)
    
    lazy var balanceLabel: LabelDefault = {
        let label = LabelDefault(text: "Saldo", color: .white, font: .boldSystemFont(ofSize: 18))
        label.textAlignment = .center
        label.backgroundColor = .lilas
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    
    lazy var amountLabel = LabelDefault(text: "", color: .lilas, font: .boldSystemFont(ofSize: 26))
    
    lazy var hideAmountButton: ButtonDefault = {
        let button = ButtonDefault(nameImage: "iconEyeShow")
        button.layer.masksToBounds = true
        button.backgroundColor = .lilas
        return button
    }()
    
    lazy var activityIndicator = ActivityDefault()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        cv.setCollectionViewLayout(layout, animated: false)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
   
    lazy var viewInvestiments = ViewDefault(backgroundColor: .white, alpha: 0.7)
    
    lazy var balanceInvestimentsLabel: LabelDefault = {
        let label = LabelDefault(text: "Valor Investido", color: .white, font: .boldSystemFont(ofSize: 18))
        label.backgroundColor = .lilas
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 20, height: 20)
        label.layer.shadowRadius = 5.0
        label.layer.masksToBounds = true
        return label
    }()
    
    lazy var amountInvestimentsLabel = LabelDefault(text: "R$: 0", color: .lilas, font: .boldSystemFont(ofSize: 26))
    
    lazy var hideAmountInvestimentsButton: ButtonDefault = {
        let button = ButtonDefault(nameImage: "iconEyeShow")
        button.layer.cornerRadius = button.frame.size.height/2
        button.layer.masksToBounds = true
        button.backgroundColor = .lilas
        return button
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
        setViewBalance()
        setBalanceLabel()
        setAmountLabel()
        setHideAmountButton()
        setActivityIndicator()
        setCollectionView()
        setViewInvestiments()
        setBalanceInvestimentsLabel()
        setAmounInvestimentstLabel()
        setHideAmountInvestimentsButton()
        
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
    
    private func setBalanceLabel() {
        viewBalance.addSubview(balanceLabel)
        
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: viewBalance.topAnchor, constant: 35),
            balanceLabel.leadingAnchor.constraint(equalTo: viewBalance.leadingAnchor, constant: 20),
            balanceLabel.widthAnchor.constraint(equalToConstant: 80)
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
            hideAmountButton.widthAnchor.constraint(equalToConstant: 35),
            hideAmountButton.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    private func setActivityIndicator() {
        viewBalance.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: amountLabel.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor)
        ])
    }
    
    private func setCollectionView() {
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: viewBalance.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: viewBalance.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: viewBalance.trailingAnchor),
            collectionView.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70)
        ])
    }
    
    private func setViewInvestiments() {
        self.addSubview(viewInvestiments)
        
        NSLayoutConstraint.activate([
            viewInvestiments.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            viewInvestiments.leadingAnchor.constraint(equalTo: viewBalance.leadingAnchor),
            viewInvestiments.trailingAnchor.constraint(equalTo: viewBalance.trailingAnchor),
            viewInvestiments.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
        
    private func setBalanceInvestimentsLabel() {
        viewInvestiments.addSubview(balanceInvestimentsLabel)
        
        NSLayoutConstraint.activate([
            balanceInvestimentsLabel.topAnchor.constraint(equalTo: viewInvestiments.topAnchor, constant: 35),
            balanceInvestimentsLabel.leadingAnchor.constraint(equalTo: viewInvestiments.leadingAnchor, constant: 20),
            balanceInvestimentsLabel.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    private func setAmounInvestimentstLabel() {
        viewInvestiments.addSubview(amountInvestimentsLabel)
        
        NSLayoutConstraint.activate([
            amountInvestimentsLabel.topAnchor.constraint(equalTo: balanceInvestimentsLabel.bottomAnchor, constant: 10),
            amountInvestimentsLabel.leadingAnchor.constraint(equalTo: balanceInvestimentsLabel.leadingAnchor),
            amountInvestimentsLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
    
    private func setHideAmountInvestimentsButton() {
        viewInvestiments.addSubview(hideAmountInvestimentsButton)
        
        NSLayoutConstraint.activate([
            hideAmountInvestimentsButton.centerYAnchor.constraint(equalTo: balanceInvestimentsLabel.centerYAnchor),
            hideAmountInvestimentsButton.leadingAnchor.constraint(equalTo: balanceInvestimentsLabel.trailingAnchor, constant: 10),
            hideAmountInvestimentsButton.widthAnchor.constraint(equalToConstant: 35),
            hideAmountInvestimentsButton.heightAnchor.constraint(equalToConstant: 35),
            
        ])
    }
    
}
