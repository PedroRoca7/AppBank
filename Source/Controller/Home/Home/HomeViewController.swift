//
//  HomeViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    // MARK: Propertys
    var user: User?
    private var disposeBag = DisposeBag()
    private var collectionViewButtons: [String] = ["carteira", "transações", "cartão", "minha conta"]
    private var cellView = CollectionCellView()
    lazy private var viewScreen: HomeView = {
        let view = HomeView()
        return view
    }()
    
    lazy private var walletViewController: WalletViewController = {
        let view = WalletFactory.makeModule()
        return view
    }()
    
    lazy private var transactionsViewController: TransactionsViewController = {
        let view = TransactionsFactory.makeModule()
        return view
    }()
    
    lazy private var creditCardViewController: CreditCardViewController = {
        let view = CreditCardFactory.makeModule()
        return view
    }()
    
    lazy private var myDataViewController: MyDataViewController = {
        let view = MyDataFactory.makeModule()
        return view
    }()
    
    private var viewModel: HomeViewModeling
    
    // MARK: Inits
    
    init(viewModel: HomeViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadStatements()
        setupNameClientLabel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cellView.layer.cornerRadius = cellView.frame.width / 2
        hideKeyBoardWhenTapped()
        setupDelegates()
        setupConfigNavigationBar()
    }
}

private extension HomeViewController {

    func setupConfigNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupAddChildWalletViewController() {
        addChild(walletViewController)
        viewScreen.viewCustom.addSubview(walletViewController.view)
        walletViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            walletViewController.view.topAnchor.constraint(equalTo: viewScreen.viewCustom.topAnchor),
            walletViewController.view.leadingAnchor.constraint(equalTo: viewScreen.viewCustom.leadingAnchor),
            walletViewController.view.trailingAnchor.constraint(equalTo: viewScreen.viewCustom.trailingAnchor),
            walletViewController.view.bottomAnchor.constraint(equalTo: viewScreen.viewCustom.bottomAnchor),
        ])
    }
    
    func setupAddChildTransactionsViewController() {
        addChild(transactionsViewController)
        viewScreen.viewCustom.addSubview(transactionsViewController.view)
        transactionsViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            transactionsViewController.view.topAnchor.constraint(equalTo: viewScreen.viewCustom.topAnchor),
            transactionsViewController.view.leadingAnchor.constraint(equalTo: viewScreen.viewCustom.leadingAnchor),
            transactionsViewController.view.trailingAnchor.constraint(equalTo: viewScreen.viewCustom.trailingAnchor),
            transactionsViewController.view.bottomAnchor.constraint(equalTo: viewScreen.viewCustom.bottomAnchor),
        ])
    }
    
    func setupAddChildCreditCardViewController() {
        addChild(creditCardViewController)
        viewScreen.viewCustom.addSubview(creditCardViewController.view)
        creditCardViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            creditCardViewController.view.topAnchor.constraint(equalTo: viewScreen.viewCustom.topAnchor),
            creditCardViewController.view.leadingAnchor.constraint(equalTo: viewScreen.viewCustom.leadingAnchor),
            creditCardViewController.view.trailingAnchor.constraint(equalTo: viewScreen.viewCustom.trailingAnchor),
            creditCardViewController.view.bottomAnchor.constraint(equalTo: viewScreen.viewCustom.bottomAnchor),
        ])
    }
    
    func setupAddChildMyDataViewController() {
        addChild(myDataViewController)
        viewScreen.viewCustom.addSubview(myDataViewController.view)
        myDataViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            myDataViewController.view.topAnchor.constraint(equalTo: viewScreen.viewCustom.topAnchor),
            myDataViewController.view.leadingAnchor.constraint(equalTo: viewScreen.viewCustom.leadingAnchor),
            myDataViewController.view.trailingAnchor.constraint(equalTo: viewScreen.viewCustom.trailingAnchor),
            myDataViewController.view.bottomAnchor.constraint(equalTo: viewScreen.viewCustom.bottomAnchor),
        ])
    }

    func setupNameClientLabel() {
        guard let user = self.user else { return }
        viewScreen.nameClientLabel.text = user.name
    }
    
    func setupDelegates() {
        viewScreen.collectionView.dataSource = self
        viewScreen.collectionView.delegate = self
    }
}

extension HomeViewController: HomeViewModelProtocol {
    func success(balance: Double) {
        DispatchQueue.main.async {
            self.walletViewController.viewScreen.accountView.valueAccountLabel.text = FormatterNumber.formatNumberToCurrency(value: balance, typeCurrency: "pt-BR", currencySymbol: "R$")
        }
    }
    
    func failure() {
        print("Falha ao carregar o saldo")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewButtons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.identifier, for: indexPath) as? CustomCollectionCell
        
        let titleString = collectionViewButtons[indexPath.row]
        cell?.prepareCollectionCell(title: titleString, nameImage: titleString)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            setupAddChildWalletViewController()
        case 1:
            setupAddChildTransactionsViewController()
        case 2:
            setupAddChildCreditCardViewController()
        case 3:
            setupAddChildMyDataViewController()
        default:
            break
        }
    }
}

extension HomeViewController: AlertProtocol {}
