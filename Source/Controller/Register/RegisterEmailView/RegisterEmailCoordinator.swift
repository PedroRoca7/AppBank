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
    func showRegisterPassword()
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
    
    public func showRegisterPassword() {
//        navigationController.popViewController(animated: true)
    }
}
