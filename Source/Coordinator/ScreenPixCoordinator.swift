//
//  ScreenPixCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/10/23.
//

import Foundation
import UIKit

class ScreenPixCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ScreenPixViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
