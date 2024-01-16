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
    
    lazy var profileButton: ButtonDefault = {
        let bt = ButtonDefault(nameImage: "iconProfile")
        bt.widthAnchor.constraint(equalToConstant: 40).isActive = true
        bt.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bt.layer.cornerRadius = bt.frame.size.width / 2
        bt.clipsToBounds = true
        return bt
    }()
    
    lazy var helloClientLabel = LabelDefault(text: "Hello", color: .gray, font: .systemFont(ofSize: 12, weight: .semibold))
    lazy var welcomeClientLabel = LabelDefault(text: "Welcome Back!", color: .black, font: .systemFont(ofSize: 12, weight: .semibold))
    
    lazy var notificationButton: ButtonDefault = {
        let bt = ButtonDefault(nameImage: "iconBell")
        bt.layer.cornerRadius = 15
        return bt
    }()
   
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [viewBalance, collectionView, viewInvestiments])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 15
        
        return stackView
    }()
    
    lazy var viewBalance: ViewDefault = {
        let view = ViewDefault(backgroundColor: .lilas)
        return view
    }()
    
    lazy var iconWalletImageView = ImageViewDefault(nameImage: "iconWallet")
    lazy var balanceLabel = LabelDefault(text: "Your wallet balance:", color: .white, font: .systemFont(ofSize: 12, weight: .bold))
    lazy var amountLabel = LabelDefault(text: "", color: .white, font: .boldSystemFont(ofSize: 24))
    lazy var hideAmountButton = ButtonDefault(nameImage: "iconEyeShow")
    lazy var activityIndicator = ActivityDefault()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 80)
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .lilas
        cv.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.layer.cornerRadius = 10
        return cv
    }()
   
    lazy var viewInvestiments: ViewDefault = {
        let view = ViewDefault(backgroundColor: .lilas)

        return view
    }()
    lazy var iconInvestimentsImage = ImageViewDefault(nameImage: "iconInvestiments")
    lazy var balanceInvestimentsLabel = LabelDefault(text: "Your investiments", color: .white, font: .systemFont(ofSize: 12, weight: .bold))
    lazy var amountInvestimentsLabel = LabelDefault(text: "$ 0.00", color: .white, font: .systemFont(ofSize: 24, weight: .bold))
    
    lazy var hideAmountInvestimentsButton = ButtonDefault(nameImage: "iconEyeShow")
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCodeUIView {

    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        self.addSubview(profileButton)
        self.addSubview(helloClientLabel)
        self.addSubview(welcomeClientLabel)
        self.addSubview(notificationButton)
        self.addSubview(stackView)
        viewBalance.addSubview(iconWalletImageView)
        viewBalance.addSubview(balanceLabel)
        viewBalance.addSubview(amountLabel)
        viewBalance.addSubview(hideAmountButton)
        viewBalance.addSubview(activityIndicator)
        viewInvestiments.addSubview(iconInvestimentsImage)
        viewInvestiments.addSubview(balanceInvestimentsLabel)
        viewInvestiments.addSubview(amountInvestimentsLabel)
        viewInvestiments.addSubview(hideAmountInvestimentsButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            profileButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
        ])

        NSLayoutConstraint.activate([
            helloClientLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 25),
            helloClientLabel.leadingAnchor.constraint(equalTo: profileButton.trailingAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
            welcomeClientLabel.topAnchor.constraint(equalTo: helloClientLabel.bottomAnchor, constant: 5),
            welcomeClientLabel.leadingAnchor.constraint(equalTo: profileButton.trailingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            notificationButton.centerYAnchor.constraint(equalTo: profileButton.centerYAnchor),
            notificationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -165)
        ])

        NSLayoutConstraint.activate([
            iconWalletImageView.topAnchor.constraint(equalTo: viewBalance.topAnchor, constant: 15),
            iconWalletImageView.leadingAnchor.constraint(equalTo: viewBalance.leadingAnchor, constant: 10),
            iconWalletImageView.widthAnchor.constraint(equalToConstant: 25),
            iconWalletImageView.heightAnchor.constraint(equalToConstant: 25)
        ])

        NSLayoutConstraint.activate([
            balanceLabel.centerYAnchor.constraint(equalTo: iconWalletImageView.centerYAnchor),
            balanceLabel.leadingAnchor.constraint(equalTo: iconWalletImageView.trailingAnchor, constant: 3),
            balanceLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 115)
        ])

        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 5),
            amountLabel.leadingAnchor.constraint(equalTo: iconWalletImageView.leadingAnchor),
            amountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            hideAmountButton.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor),
            hideAmountButton.leadingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: 5),
            hideAmountButton.widthAnchor.constraint(equalToConstant: 35),
            hideAmountButton.heightAnchor.constraint(equalToConstant: 35),
        ])

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: balanceLabel.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor,constant: 5)
        ])

        NSLayoutConstraint.activate([
            iconInvestimentsImage.topAnchor.constraint(equalTo: viewInvestiments.topAnchor, constant: 15),
            iconInvestimentsImage.leadingAnchor.constraint(equalTo: viewInvestiments.leadingAnchor, constant: 10),
            iconInvestimentsImage.widthAnchor.constraint(equalToConstant: 25),
            iconInvestimentsImage.heightAnchor.constraint(equalToConstant: 25)
        ])

        NSLayoutConstraint.activate([
            balanceInvestimentsLabel.centerYAnchor.constraint(equalTo: iconInvestimentsImage.centerYAnchor),
            balanceInvestimentsLabel.leadingAnchor.constraint(equalTo: iconInvestimentsImage.trailingAnchor, constant: 3),
            balanceInvestimentsLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 115)
        ])

        NSLayoutConstraint.activate([
            amountInvestimentsLabel.topAnchor.constraint(equalTo: balanceInvestimentsLabel.bottomAnchor, constant: 5),
            amountInvestimentsLabel.leadingAnchor.constraint(equalTo: iconInvestimentsImage.leadingAnchor),
            amountInvestimentsLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            hideAmountInvestimentsButton.centerYAnchor.constraint(equalTo: amountInvestimentsLabel.centerYAnchor),
            hideAmountInvestimentsButton.leadingAnchor.constraint(equalTo: amountInvestimentsLabel.trailingAnchor, constant: 5),
            hideAmountInvestimentsButton.widthAnchor.constraint(equalToConstant: 35),
            hideAmountInvestimentsButton.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
}
