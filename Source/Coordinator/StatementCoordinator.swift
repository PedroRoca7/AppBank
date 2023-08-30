//
//  StatementCoordinator.swift
//  Itubers
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class StatementCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    lazy var statementViewController: StatementViewController = {
        let viewController = StatementViewController()
        viewController.tabBarItem.image = UIImage(systemName: "dollarsign.circle")
        viewController.tabBarItem.title = "Extrato"
        return viewController
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    }
    
    
}
