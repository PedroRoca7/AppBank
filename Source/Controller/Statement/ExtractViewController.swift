//
//  ExtractViewController.swift
//  Itubers
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class ExtractViewController: ViewControllerDefault {
    
    lazy var viewScreen: ExtractView = {
        let view = ExtractView()
        
        return view
    }()
    
    lazy var viewModel: ExtractViewModel = {
        let vm = ExtractViewModel()
        return vm
    }()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Extrato"
        configDelegates()
        viewModel.loadStatements()
    }

    private func configDelegates() {
        viewScreen.tableView.delegate = self
        viewScreen.tableView.dataSource = self
        viewModel.delegate = self
    }
}

extension ExtractViewController: UITableViewDelegate, UITableViewDataSource {
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

extension ExtractViewController: ExtractViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.viewScreen.tableView.reloadData()
        }
    }
    
    func failure() {
        print("Falha ao carregar os dados da tableView")
    }
}
