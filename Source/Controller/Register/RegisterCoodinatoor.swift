//
//  RegisterCoordinatoor.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/11/23.
//

import Foundation
import UIKit

protocol RegisterCoordinating {
    func showLoginScreen()
}

class RegisterCoordinatoor: RegisterCoordinating {
    
    //MARK: Propertys
    
    weak var controller: UIViewController?
    private var navigationController: UINavigationController
    
    //MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func showLoginScreen() {
        navigationController.popToRootViewController(animated: true)
    }
}
