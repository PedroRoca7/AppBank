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
    var disposeBag = DisposeBag()
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
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.activityIndicator.startAnimating()
        viewModel.loadStatements()
        viewModel.delegate = self
        viewScreen.hideAmountButton.rx.tap.bind {
            if self.viewScreen.amountLabel.isHidden == true {
                self.viewScreen.amountLabel.isHidden = false
                self.viewScreen.hideAmountButton.setImage(UIImage(named: "eyeShow"),for: .normal)
            } else {
                self.viewScreen.amountLabel.isHidden = true
                self.viewScreen.hideAmountButton.setImage(UIImage(named: "eyeHide"),for: .normal)
            }
        }.disposed(by: disposeBag)
        
        viewScreen.hideAmountInvestimentsButton.rx.tap.bind {
            if self.viewScreen.amountInvestimentsLabel.isHidden == true {
                self.viewScreen.amountInvestimentsLabel.isHidden = false
                self.viewScreen.hideAmountInvestimentsButton.setImage(UIImage(named: "eyeShow"),for: .normal)
            } else {
                self.viewScreen.amountInvestimentsLabel.isHidden = true
                self.viewScreen.hideAmountInvestimentsButton.setImage(UIImage(named: "eyeHide"),for: .normal)
            }
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
