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
        let tabBarController = TabBarCoordinator(navigationController: controller?.navigationController ?? UINavigationController(),
                                                 user: user)
        tabBarController.start()
    }
    
    func startRegisterScreen() {
        let registerView = RegisterFactory.makeModule(navigationController: controller?.navigationController ?? UINavigationController())
        controller?.navigationController?.pushViewController(registerView, animated: true)
        
    }
}
