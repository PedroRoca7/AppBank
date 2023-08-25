//
//  HomeCoordinator.swift
//  Itubers
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let user: User
    
    init(navigationController: UINavigationController, user: User) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        let viewController = HomeViewController()
        viewController.user = self.user
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
