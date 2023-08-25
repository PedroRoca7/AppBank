//
//  HomeViewController.swift
//  Itubers
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

class HomeViewController: ViewControllerDefault {
    
    // MARK: Propertys
    var user: User?
    lazy var viewScreen: HomeView = {
        let view = HomeView()
        
        return view
    }()
    
    // MARK: Inits
    override func loadView() {
        self.view = viewScreen
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationController()
        configDelegates()
        viewScreen.tableView.backgroundColor = .white
    }
    
    private func configNavigationController() {
        title = "Olá \(user?.name ?? "")"
        navigationItem.hidesBackButton = true
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        //        let character = chars[indexPath.row]
        //        cell?.prepareCell(with: character)
        
        return cell ?? UITableViewCell()
    }
}
