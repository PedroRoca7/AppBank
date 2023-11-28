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
    lazy var viewBalance = ViewDefault(backgroundColor: .clear, alpha: 1)
    lazy var subViewBalance = ViewDefault(backgroundColor: .lilas, alpha: 0.5)
    lazy var balanceLabel = LabelDefault(text: "Saldo", color: .white, font: .boldSystemFont(ofSize: 18))
    lazy var amountLabel = LabelDefault(text: "", color: .white, font: .boldSystemFont(ofSize: 26))
    lazy var hideAmountButton = ButtonDefault(nameImage: "eyeShow")
    lazy var activityIndicator = ActivityDefault()
   
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .none
        cv.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        cv.setCollectionViewLayout(layout, animated: false)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    lazy var viewInvesiments = ViewDefault(backgroundColor: .clear, alpha: 1)
    lazy var subViewInvestiments = ViewDefault(backgroundColor: .lilas, alpha: 0.5)
    lazy var balanceInvestimentsLabel = LabelDefault(text: "Valor Investido", color: .white, font: .boldSystemFont(ofSize: 18))
    lazy var amountInvestimentsLabel = LabelDefault(text: "R$: 0", color: .white, font: .boldSystemFont(ofSize: 26))
    lazy var hideAmountInvestimentsButton = ButtonDefault(nameImage: "eyeShow")
    
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
        setActivityIndicator()
        setCollectionView()
        setSubViewInvestiments()
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
        self.addSubview(viewInvesiments)
        
        NSLayoutConstraint.activate([
            viewInvesiments.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            viewInvesiments.leadingAnchor.constraint(equalTo: viewBalance.leadingAnchor),
            viewInvesiments.trailingAnchor.constraint(equalTo: viewBalance.trailingAnchor),
            viewInvesiments.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setSubViewInvestiments() {
        self.addSubview(subViewInvestiments)
        
        NSLayoutConstraint.activate([
            subViewInvestiments.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            subViewInvestiments.leadingAnchor.constraint(equalTo: viewBalance.leadingAnchor),
            subViewInvestiments.trailingAnchor.constraint(equalTo: viewBalance.trailingAnchor),
            subViewInvestiments.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setBalanceInvestimentsLabel() {
        viewInvesiments.addSubview(balanceInvestimentsLabel)
        
        NSLayoutConstraint.activate([
            balanceInvestimentsLabel.topAnchor.constraint(equalTo: viewInvesiments.topAnchor, constant: 35),
            balanceInvestimentsLabel.leadingAnchor.constraint(equalTo: viewInvesiments.leadingAnchor, constant: 20),
            balanceInvestimentsLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30)
        ])
    }
    
    private func setAmounInvestimentstLabel() {
        viewInvesiments.addSubview(amountInvestimentsLabel)
        
        NSLayoutConstraint.activate([
            amountInvestimentsLabel.topAnchor.constraint(equalTo: balanceInvestimentsLabel.bottomAnchor, constant: 10),
            amountInvestimentsLabel.leadingAnchor.constraint(equalTo: balanceInvestimentsLabel.leadingAnchor),
            amountInvestimentsLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
    
    private func setHideAmountInvestimentsButton() {
        viewInvesiments.addSubview(hideAmountInvestimentsButton)
        
        NSLayoutConstraint.activate([
            hideAmountInvestimentsButton.centerYAnchor.constraint(equalTo: balanceInvestimentsLabel.centerYAnchor),
            hideAmountInvestimentsButton.leadingAnchor.constraint(equalTo: balanceInvestimentsLabel.trailingAnchor, constant: 10),
            hideAmountInvestimentsButton.widthAnchor.constraint(equalToConstant: 30),
            hideAmountInvestimentsButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
}
