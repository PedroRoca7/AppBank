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
    private var collectionViewButtons: [String] = ["Pix", "Fazer Transfêrencia", "Pagar contas", "Seguros"]
    
    lazy private var viewScreen: HomeView = {
        let view = HomeView()
        return view
    }()
    
    private var viewModel: ExtractViewModeling
    
    // MARK: Inits
    
    init(viewModel: ExtractViewModeling) {
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
        setupTabBar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
        viewScreen.activityIndicator.startAnimating()
        viewModel.loadStatements()
        setupDelegates()
        hideOrShowBalance(button: viewScreen.hideAmountButton, label: viewScreen.amountLabel)
        hideOrShowBalance(button: viewScreen.hideAmountInvestimentsButton, label: viewScreen.amountInvestimentsLabel)
    }
}

private extension HomeViewController {
    func setupTabBar() {
        guard let user = self.user else { return }
        self.tabBarController?.navigationItem.title = "Olá \(user.name)"
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
        self.tabBarController?.navigationItem.titleView?.tintColor = .white
        self.tabBarController?.navigationItem.titleView?.backgroundColor = .lilas
    }
    
    func setupDelegates() {
        viewScreen.collectionView.dataSource = self
        viewScreen.collectionView.delegate = self
    }
    
    func hideOrShowBalance(button: UIButton, label: UILabel) {
        button.rx.tap.bind {
            label.isHidden.toggle()
            button.setImage(UIImage(named: label.isHidden ? "eyeHide" : "eyeShow"), for: .normal)
        }.disposed(by: disposeBag)
    }
}

extension HomeViewController: ExtractViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.viewScreen.amountLabel.text = FormatterNumber.formatNumberToCurrency(value: self.viewModel.currentBalance(), typeCurrency: "pt-BR", currencySymbol: "R$")
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
        cell?.prepareCollectionCell(title: button)
        
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
            self.pixButtonTap?()
        case .transfer:
            Alert.showBasicAlert(title: "Transferências", message: "Você clicou para fazer uma transferencia.", viewController: self) {}
        case .pay:
            Alert.showBasicAlert(title: "Pagamentos", message: "Você clicou para fazer um pagamento.", viewController: self) {}
        case.security:
            Alert.showBasicAlert(title: "Seguros", message: "Você clicou para solicitar um seguro.", viewController: self) {}
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 80)
    }
}
