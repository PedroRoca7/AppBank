//
//  LoginCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/11/23.
//

import Foundation
import UIKit

protocol LoginCoordinating {
    func showHomeController(user: User)
    func startRegisterScreen()
}

class LoginCoordinator: LoginCoordinating {
    
    weak var controller: UIViewController?
    
    func showHomeController(user: User) {
        let homeViewController = HomeFactory.makeModule(navigationController: controller?.navigationController ?? UINavigationController(), user: user)
        controller?.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    func startRegisterScreen() {
        let registerNameView = RegisterNameFactory.makeModule(navigationController: controller?.navigationController ?? UINavigationController())
        controller?.navigationController?.pushViewController(registerNameView, animated: true)
        
    }
}
