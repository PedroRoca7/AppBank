//
//  ExtractViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class ExtractViewController: UIViewController {
    
    // MARK: Propertys
    
    let diposedBag = DisposeBag()
    lazy var viewScreen: ExtractView = {
        let view = ExtractView()
        view.backgroundColor = .lilas
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
        viewModel.loadStatements()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
        configDelegates()
        filterExtractSegmentedControlePressed()
    }
    
    private func configDelegates() {
        viewScreen.tableView.delegate = self
        viewScreen.tableView.dataSource = self
    }
    
    private func filterExtractSegmentedControlePressed() {
        let segmentedControlValeu = BehaviorSubject<Int>(value: 1)
        
        viewScreen.segmentedControl.rx.selectedSegmentIndex
            .asObservable()
            .bind(to: segmentedControlValeu)
            .disposed(by: diposedBag)
        
        segmentedControlValeu
            .subscribe { selectedIndex in
                self.viewModel.filterExtract(index: selectedIndex)
            }.disposed(by: diposedBag)
    }
}

extension ExtractViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView DataSource
    
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

extension ExtractViewController: ExtractViewModelProtocol {
    func success(balance: Double) {
        DispatchQueue.main.async {
            self.viewScreen.amountLabel.text = FormatterNumber.formatNumberToCurrency(value: balance, typeCurrency: "pt-BR", currencySymbol: "$")
            self.viewScreen.tableView.reloadData()
        }
    }
    
    func failure() {
        print("Falha ao carregar os dados da tableView")
    }
}
