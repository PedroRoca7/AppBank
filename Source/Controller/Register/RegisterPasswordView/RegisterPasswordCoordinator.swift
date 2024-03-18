//
//  RegisterPasswordCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 15/03/24.
//

import Foundation
import UIKit

protocol RegisterPasswordCoordinating {
    func backViewController()
    func showRequestScreen()
}

final class RegisterPasswordCoordinator: RegisterPasswordCoordinating {
    
    //MARK: Propertys
    
    var navigationController: UINavigationController

    //MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func backViewController() {
        navigationController.popViewController(animated: true)
    }
    
    public func showRequestScreen() {
        let requestScreen = RegisterToAnalyseFactory.makeModule(navigationController: navigationController)
        navigationController.pushViewController(requestScreen, animated: true)
    }
}
