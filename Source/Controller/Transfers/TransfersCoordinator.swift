//
//  TransfersCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 26/03/24.
//

import Foundation
import UIKit

protocol TransfersCoordinating {
    func showPixScreen()
}

class TransfersCoordinator: TransfersCoordinating {
    
    var navigationController: UINavigationController
    
    //MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showPixScreen() {
        let pixScreen = PixFactory.makeModule(navigationController: navigationController)
        navigationController.pushViewController(pixScreen, animated: true)
    }
}
