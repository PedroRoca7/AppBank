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
    lazy var homeViewController: HomeViewController = {
        let viewController = HomeViewController()
        viewController.tabBarItem.image = UIImage(systemName: "homekit")
        viewController.tabBarItem.title = "Home"
        viewController.user = self.user
        return viewController
    }()
    
    
    init(navigationController: UINavigationController, user: User) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
    }
    
    
}
