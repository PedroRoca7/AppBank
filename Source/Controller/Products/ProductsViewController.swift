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
        return view
    }()
    
    lazy var headerTableView: HeaderTableView = {
        let view = HeaderTableView(frame: CGRect(x: 0, y: 0, width: viewScreen.tableView.frame.size.width, height: 230))
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
        configHeaderTableView()
        addOptionsTableView()
    }
    
    private func configDelegates() {
        viewScreen.tableView.delegate = self
        viewScreen.tableView.dataSource = self
    }
    
    private func addOptionsTableView() {
        
        optionsTableView.append(OptionsTableView(title: "Investimentos",
                                                 options: [OptionsInvestiments(icon: "eyeShow", optionInvestiment: "Poupança"),
                                                          OptionsInvestiments(icon: "eyeShow", optionInvestiment: "Aplicação automática")]))
        optionsTableView.append(OptionsTableView(title: "Mais proteção e capitalização",
                                                 options: [OptionsInvestiments(icon: "eyeShow", optionInvestiment: "Odonto"),
                                                          OptionsInvestiments(icon: "eyeShow", optionInvestiment: "Capitalização(PIC)")]))
        optionsTableView.append(OptionsTableView(title: "Produtos exclusivos",
                                                 options: [OptionsInvestiments(icon: "eyeShow", optionInvestiment: "Itaú Shop"),
                                                          OptionsInvestiments(icon: "eyeShow", optionInvestiment: "Pontos e cashback"),
                                                          OptionsInvestiments(icon: "eyeShow", optionInvestiment: "IPhone pra Sempre"),
                                                          OptionsInvestiments(icon: "eyeShow", optionInvestiment: "Icarros")]))
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
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return optionsTableView[section].title
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
          if let headerView = view as? UITableViewHeaderFooterView {
              headerView.textLabel?.textColor = UIColor.white
          }
      }
}
