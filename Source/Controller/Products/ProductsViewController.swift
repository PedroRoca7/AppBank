//
//  ProductsViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class ProductsViewController: ViewControllerDefault {
    
    lazy var viewScreen: ProductsView = {
        let view = ProductsView()
        return view
    }()
    
    lazy var headerTableView: HeaderTableView = {
        let view = HeaderTableView(frame: CGRect(x: 0, y: 0, width: viewScreen.tableView.frame.size.width, height: 100))
        return view
    }()
    
    private var optionsTableView: [OptionsTableView] = []
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegates()
        configHeaderTableView()
        addOptionsTableView()
    }
    
    private func configDelegates() {
        viewScreen.tableView.delegate = self
        viewScreen.tableView.dataSource = self
    }
    
    private func addOptionsTableView() {
        optionsTableView.append(OptionsTableView(title: "Investimentos", options: ["Poupança", "Aplicação automática"]))
        optionsTableView.append(OptionsTableView(title: "Mais proteção e capitalização", options: ["Odonto", "Capitalização(PIC)"]))
        optionsTableView.append(OptionsTableView(title: "Produtos exclusivos", options: ["Itaú Shop", "Pontos e cashback"]))
    }
    
    private func configHeaderTableView() {
        viewScreen.tableView.tableHeaderView = headerTableView
    }
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return optionsTableView.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsTableView[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomProductsTableViewCell.identifier, for: indexPath) as? CustomProductsTableViewCell
        
        cell?.prepareCell(optionLabel: optionsTableView[indexPath.section].options[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return optionsTableView[section].title
    }
    
}
