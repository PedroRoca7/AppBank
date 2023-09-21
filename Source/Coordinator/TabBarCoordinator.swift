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
        
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController, user: self.user )
        let extractCoordinator = ExtractCoordinator(navigationController: self.navigationController)
        let productsCoordinator = ProductsCoordinator(navigationController: self.navigationController)
        
        tabBarController.setViewControllers([homeCoordinator.homeViewController, extractCoordinator.extractViewController, productsCoordinator.productsViewController], animated: true)
        
        self.navigationController.pushViewController(tabBarController, animated: true)
    }
    
    
}
