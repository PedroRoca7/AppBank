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
        let view = WalletViewController()
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
    
    func setupAddChildWalletViewController2() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        addChild(viewController)
        viewScreen.viewCustom.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: viewScreen.viewCustom.topAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: viewScreen.viewCustom.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: viewScreen.viewCustom.trailingAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: viewScreen.viewCustom.bottomAnchor),
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
    
    func hideOrShowBalance(button: UIButton, label: UILabel) {
        button.rx.tap.bind {
            label.isHidden.toggle()
            button.setImage(UIImage(named: label.isHidden ? "iconEyeHide" : "iconEyeShow"), for: .normal)
        }.disposed(by: disposeBag)
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
            setupAddChildWalletViewController2()
        case 2:
            showBasicAlert(title: "Pagamentos", message: "Você clicou para fazer um pagamento.", viewController: self) {}
        case 3:
            showBasicAlert(title: "Seguros", message: "Você clicou para solicitar um seguro.", viewController: self) {}
        default:
            break
        }
    }
}

extension HomeViewController: AlertProtocol {}
