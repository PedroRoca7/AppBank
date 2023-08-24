//
//  LoginCoordinator.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
