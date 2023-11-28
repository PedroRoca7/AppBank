//
//  TabBarCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class TabBarCoordinator {
    
    weak var controller: UIViewController?
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func start() {
        let tabBarController = TabBarController()
        
        let homeScreen = HomeFactory.makeModule(user: user)
        let extractScreen = ExtractFactory.makeModule()
        let productsScreen = ProductsFactory.makeModule()
        
        tabBarController.setViewControllers([homeScreen, extractScreen, productsScreen], animated: true)
        
        controller?.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    
}
