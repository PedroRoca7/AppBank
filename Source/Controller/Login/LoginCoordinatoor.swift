//
//  LoginCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/11/23.
//

import Foundation
import UIKit

protocol LoginCoordinating {
    func startTabController(user: User)
    func startRegisterScreen()
}

class LoginCoordinator: LoginCoordinating {
    
    private let navigationController: UINavigationController
    weak var controller: UIViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startTabController(user: User) {
        let tabBarController = TabBarCoordinator(navigationController: navigationController, user: user)
        tabBarController.start()
    }
    
    func startRegisterScreen() {
        let register = RegisterFactory.makeModule(navigationController: navigationController)
        navigationController.pushViewController(register, animated: true)
    }
}
