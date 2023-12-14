//
//  ScreenPixCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 14/11/23.
//

import Foundation
import UIKit

protocol ScreenPixCoordinating {
    func showHomeScreen()
}

class ScreenPixCoordinator: ScreenPixCoordinating {
    
    //MARK: Propertys
    
    private var navigationController: UINavigationController
    
    //MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showHomeScreen() {
        navigationController.popViewController(animated: true)
    }
}
