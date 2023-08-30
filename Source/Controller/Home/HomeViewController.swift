//
//  HomeViewController.swift
//  Itubers
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
    
    lazy var viewModel: HomeViewModel = {
        let vm = HomeViewModel()
        return vm
    }()
    
    // MARK: Inits
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationController()
        configDelegates()
        viewModel.loadStatements()
        viewScreen.amountLabel.text = FormatterNumber.formatNumberToCurrency(value: viewModel.currentBalance(), typeCurrency: "pt-BR", currencySimbol: "R$")
        
        viewScreen.hideAmountButton.rx.tap.bind {
            if self.viewScreen.amountLabel.isHidden == true {
                self.viewScreen.amountLabel.isHidden = false
                self.viewScreen.hideAmountButton.setImage(UIImage(named: "eyeShow"),for: .normal)
            } else {
                self.viewScreen.amountLabel.isHidden = true
                self.viewScreen.hideAmountButton.setImage(UIImage(named: "eyeHide"),for: .normal)
            }
        }.disposed(by: disposeBag)
        
    }
    
    private func configNavigationController() {
        navigationController?.navigationItem.title = "Olá \(user?.name ?? "")"
        navigationController?.navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributed = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributed
    }
    
    private func configDelegates() {
        viewScreen.tableView.delegate = self
        viewScreen.tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        let statement = viewModel.statements[indexPath.row]
        cell?.prepareCell(statement: statement)
        
        return cell ?? UITableViewCell()
    }
}
