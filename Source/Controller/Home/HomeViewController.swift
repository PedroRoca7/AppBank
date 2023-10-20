//
//  HomeViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: ViewControllerDefault {
    
    // MARK: Propertys
    var user: User?
    private var disposeBag = DisposeBag()
    private var collectionViewButtons: [String] = ["Pix", "Fazer Transfêrencia", "Pagar contas", "Seguros"]
    
    lazy var viewScreen: HomeView = {
        let view = HomeView()
        return view
    }()
    
    lazy var viewModel: ExtractViewModel = {
        let vm = ExtractViewModel()
        return vm
    }()
    
    // MARK: Inits
    override func loadView() {
        self.view = viewScreen

    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let user = self.user else { return }
        self.tabBarController?.navigationItem.title = "Olá \(user.name)"
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
        self.tabBarController?.navigationItem.titleView?.tintColor = .white
        self.tabBarController?.navigationItem.titleView?.backgroundColor = .lilas
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.activityIndicator.startAnimating()
        viewModel.loadStatements()
        configDelegates()
        bindToggleAction(button: viewScreen.hideAmountButton, label: viewScreen.amountLabel)
        bindToggleAction(button: viewScreen.hideAmountInvestimentsButton, label: viewScreen.amountInvestimentsLabel)
    }
    
    private func configDelegates() {
        viewModel.delegate = self
        viewScreen.collectionView.dataSource = self
        viewScreen.collectionView.delegate = self
    }
    
    private func bindToggleAction(button: UIButton, label: UILabel) {
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

                switch buttonEnum {
                case .pix:
                    Alert.showBasicAlert(title: "Pix", message: "Você clicou para fazer um pix", viewController: self) {}
                case .transfer:
                    Alert.showBasicAlert(title: "Transferências", message: "Você clicou para fazer uma transferencia.", viewController: self) {}
                case .pay:
                    Alert.showBasicAlert(title: "Pagamentos", message: "Você clicou para fazer um pagamento.", viewController: self) {}
                case.security:
                    Alert.showBasicAlert(title: "Seguros", message: "Você clicou para solicitar um seguro.", viewController: self) {}
                }
            }
        }.disposed(by: disposeBag)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 80)
    }
}
