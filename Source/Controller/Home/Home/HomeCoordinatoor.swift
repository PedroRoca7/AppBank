//
//  HomeCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/11/23.
//

import Foundation
import UIKit

protocol HomeCoordinating {
    func showPixScreen(_ pixKey: String)
}

class HomeCoordinator: HomeCoordinating {
    
    //MARK: Propertys
    
    var navigationController: UINavigationController
    
    //MARK: Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showPixScreen(_ pixKey: String) {
        let pixScreen = PixFactory.makeModule(navigationController: navigationController)
        navigationController.present(pixScreen, animated: true)
    }
    
}
