//
//  RegisterToAnalyseCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 18/03/24.
//

import UIKit

protocol RegisterToAnalyseCoordinating {
    func showLoginScreen()
}

final class RegisterToAnalyseCoordinator: RegisterToAnalyseCoordinating {
    
    //MARK: Propertys

    var navigationController: UINavigationController

    //MARK: Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func showLoginScreen() {
        navigationController.popToRootViewController(animated: true)
    }
    
}
