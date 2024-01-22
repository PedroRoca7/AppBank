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
    var pixButtonTap: (() -> Void)?
    private var disposeBag = DisposeBag()
    private var collectionViewButtons: [String] = ["Pix", "Transfer", "Pay account", "Security", "Credit Card", "Collect"]
    private var cellView = CollectionCellView()
    
    lazy private var viewScreen: HomeView = {
        let view = HomeView()
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
        viewScreen.backgroundColor = .backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewScreen.activityIndicator.startAnimating()
        viewModel.loadStatements()
        setupNameClientLabel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cellView.button.layer.cornerRadius = cellView.button.frame.width / 2
        hideKeyBoardWhenTapped()
        
        setupDelegates()
        hideOrShowBalance(button: viewScreen.hideAmountButton, label: viewScreen.amountLabel)
        hideOrShowBalance(button: viewScreen.hideAmountInvestimentsButton, label: viewScreen.amountInvestimentsLabel)
    }
}

private extension HomeViewController {
    func setupNameClientLabel() {
        guard let user = self.user else { return }
        viewScreen.helloClientLabel.text = "Hello \(user.name),"
        self.tabBarController?.navigationController?.isNavigationBarHidden = true
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
            self.viewScreen.amountLabel.text = FormatterNumber.formatNumberToCurrency(value: balance, typeCurrency: "pt-BR", currencySymbol: "$")
            self.viewScreen.activityIndicator.stopAnimating()
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
        
        let button: String = collectionViewButtons[indexPath.row]
        if let buttonEnum = ChooseButton(rawValue: button) {
            cell?.prepareCollectionCell(title: button, button: buttonEnum)
        }
        cell?.cellView.button.rx.tap.bind {
            if let buttonEnum = ChooseButton(rawValue: button) {
                self.pressedButtonCollectionView(button: buttonEnum)
            }
        }.disposed(by: disposeBag)
        return cell ?? UICollectionViewCell()
    }
    
    func pressedButtonCollectionView(button: ChooseButton) {
        switch button {
        case .pix:
            viewModel.showPixScreen()
        case .transfer:
            showBasicAlert(title: "Transferências", message: "Você clicou para fazer uma transferencia.", viewController: self) {}
        case .pay:
            showBasicAlert(title: "Pagamentos", message: "Você clicou para fazer um pagamento.", viewController: self) {}
        case.security:
            showBasicAlert(title: "Seguros", message: "Você clicou para solicitar um seguro.", viewController: self) {}
        case.collect:
            showBasicAlert(title: "Collect", message: "You clic Collect", viewController: self) {}
        case.cardCredit:
            showBasicAlert(title: "Credit Card", message: "You clic Credit Card", viewController: self) {}
        }
    }
}

extension HomeViewController: AlertProtocol {}
