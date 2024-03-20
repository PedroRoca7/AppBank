//
//  TransactionsViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/03/24.
//

import Foundation
import UIKit

final class TransactionsViewController: UIViewController {
    
    lazy var viewScreen: TransactionsView = {
        let element = TransactionsView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var viewModel: TransactionsViewModeling
    
    init(viewModel: TransactionsViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadStatements()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegates()
    }
    
    private func configDelegates() {
        viewScreen.tableView.delegate = self
        viewScreen.tableView.dataSource = self
    }
}
extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {        
        return "Transações recentes"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bankStatements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomStatementTableViewCell.identifier, for: indexPath) as? CustomStatementTableViewCell
        
        let statement = viewModel.bankStatements[indexPath.row]
        cell?.prepareCell(extract: statement)
        
        return cell ?? UITableViewCell()
    }
}

extension TransactionsViewController: TransactionsViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.viewScreen.tableView.reloadData()
        }
    }
    
    func failure() {
        print("Falha ao carregar os dados da tableView")
    }
}
