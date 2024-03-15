//
//  ProductsViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class ProductsViewController: UIViewController {
    
    lazy var viewScreen: ProductsView = {
        let view = ProductsView()
        view.backgroundColor = .azulClaro
        return view
    }()
        
    private var optionsTableView: [OptionsTableView] = []
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
        configDelegates()
        addOptionsTableView()
    }
    
    private func configDelegates() {
        viewScreen.tableView.delegate = self
        viewScreen.tableView.dataSource = self
    }
    
    private func addOptionsTableView() {
        
        optionsTableView.append(OptionsTableView(title: "Investiments",
                                                 options: [OptionsInvestiments(icon: "iconSavings", optionInvestiment: "Savings"),
                                                          OptionsInvestiments(icon: "iconEngineering", optionInvestiment: "Automatic application")]))
        optionsTableView.append(OptionsTableView(title: "More protection and capitalization",
                                                 options: [OptionsInvestiments(icon: "iconDentist", optionInvestiment: "Dentist"),
                                                          OptionsInvestiments(icon: "iconAccountBalance", optionInvestiment: "Capitalization")]))
        optionsTableView.append(OptionsTableView(title: "Exclusive products",
                                                 options: [OptionsInvestiments(icon: "iconMarket", optionInvestiment: "Market"),
                                                          OptionsInvestiments(icon: "iconMoney", optionInvestiment: "Points and cashback"),
                                                          OptionsInvestiments(icon: "iconPhone", optionInvestiment: "IPhone Forever"),
                                                          OptionsInvestiments(icon: "iconCar", optionInvestiment: "Icarros")]))
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
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return optionsTableView[section].title
    }
}
