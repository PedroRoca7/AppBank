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
    
    weak var controller: UIViewController?
    
    func startTabController(user: User) {
        let tabBarController = TabBarCoordinator(navigationController: controller?.navigationController ?? UINavigationController(), user: user)
        tabBarController.controller = self.controller
        tabBarController.start()
    }
    
    func startRegisterScreen() {
        let register = RegisterFactory.makeModule()
        controller?.navigationController?.pushViewController(register, animated: true)
    }
}
