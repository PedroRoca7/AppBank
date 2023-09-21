//
//  LoginCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
    // MARK: Propertys
    
    let navigationController: UINavigationController
    
    // MARK: Inits
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        
        viewController.onLoginTap = { user in
            self.showHome(user: user)
        }
        
        viewController.onRegisterTap = {
            self.showRegister()
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showRegister() {
        let coordinator = RegisterCoordinator(navigationController: navigationController)
        coordinator.start()
    }
        
    private func showHome(user: User) {
        let coordinator = TabBarCoordinator(navigationController: navigationController, user: user)
        coordinator.start()
    }
}
