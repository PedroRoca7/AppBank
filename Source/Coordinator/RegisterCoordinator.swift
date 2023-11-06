//
//  RegisterCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class RegisterCoordinator: Coordinator {
    
    // MARK: Propertys
    
    let navigationController: UINavigationController
    
    // MARK: Inits
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterViewController()
        
        viewController.showLoginScreen = {
            self.showScreenLogin()
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showScreenLogin() {
        navigationController.popToRootViewController(animated: true)
    }
}
