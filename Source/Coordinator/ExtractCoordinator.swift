//
//  StatementCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class ExtractCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    lazy var extractViewController: UIViewController = {
        let viewController = ExtractFactory.makeModule()
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
