//
//  TabBarCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class TabBarCoordinator {
    
    let user: User
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, user: User) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        let tabBarController = TabBarController()
        
        let homeScreen = HomeFactory.makeModule(navigationController: navigationController, user: user)
        let extractScreen = ExtractFactory.makeModule(navigationController: navigationController)
        let productsScreen = ProductsFactory.makeModule(navigationController: navigationController)
        
        tabBarController.setViewControllers([homeScreen, extractScreen, productsScreen], animated: true)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
    
}
