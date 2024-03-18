//
//  RegisterEmailCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 15/03/24.
//

import Foundation
import UIKit

protocol RegisterEmailCoordinating {
    func backViewController()
    func showRegisterPassword(nameUser: String, emailUser: String)
}

final class RegisterEmailCoordinator: RegisterEmailCoordinating {
    
    //MARK: Propertys
    
    var navigationController: UINavigationController

    //MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func backViewController() {
        navigationController.popViewController(animated: true)
    }
    
    public func showRegisterPassword(nameUser: String, emailUser: String) {
        let registerPassword = RegisterPasswordFactory.makeModule(navigationController: navigationController, nameUser: nameUser, emailUser: emailUser)
        navigationController.pushViewController(registerPassword, animated: true)
    }
}
