//
//  InsertMoneyViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/10/23.
//

import UIKit

final class InsertMoneyViewController: UIViewController {
    
    lazy var viewScreen: InsertMoneyView = {
        let element = InsertMoneyView()
        return element
    }()
        
    private var coordinator: InsertMoneyCoordinator
    
    init(coordinator: InsertMoneyCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewScreen
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backItem?.title = "Inserir Dinheiro"
    }
    
}
