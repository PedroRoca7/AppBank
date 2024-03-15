//
//  RegisterCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/11/23.
//

import Foundation
import UIKit

protocol RegisterNameCoordinating {
    func backViewController()
    func showRegisterEmail(nameUser: String)
}

final class RegisterNameCoordinator: RegisterNameCoordinating {
    
    //MARK: Propertys
    
    var navigationController: UINavigationController

    //MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func backViewController() {
        navigationController.popViewController(animated: true)
    }
    
    public func showRegisterEmail(nameUser: String) {
        let registerEmail = RegisterEmailFactory.makemodule(navigationController: navigationController, nameUser: nameUser)
        navigationController.pushViewController(registerEmail, animated: true)
    }
    
}
