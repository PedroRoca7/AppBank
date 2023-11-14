//
//  TabBarCoordinator.swift
//  AppBank
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
        
        let homeScreen = HomeFactory.makeModule(navigationController: navigationController, user: user)
        let extractScreen = ExtractFactory.makeModule(navigationController: navigationController)
        let productsScreen = ProductsFactory.makeModule(navigationController: navigationController)
        
        tabBarController.setViewControllers([homeScreen, extractScreen, productsScreen], animated: true)
        
        self.navigationController.pushViewController(tabBarController, animated: true)
    }
    
    
}
