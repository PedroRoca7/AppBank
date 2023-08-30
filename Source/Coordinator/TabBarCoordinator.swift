//
//  TabBarCoordinator.swift
//  Itubers
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let user: User
    
    init(navigationController: UINavigationController, user: User) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        let tabBarController = TabBarController()
        
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController, user: self.user )
        let statementCoordinator = StatementCoordinator(navigationController: self.navigationController)
        let productsCoordinator = ProductsCoordinator(navigationController: self.navigationController)
        
        tabBarController.setViewControllers([homeCoordinator.homeViewController, statementCoordinator.statementViewController, productsCoordinator.productsViewController], animated: true)
        
        self.navigationController.pushViewController(tabBarController, animated: true)
    }
    
    
}
