//
//  ScreenPixFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 14/11/23.
//

import Foundation
import UIKit

enum ScreenPixFactory {
    static func makeModule(navigationController: UINavigationController) -> UIViewController {
        let coordinator = ScreenPixCoordinator(navigationController: navigationController)
        let screenPixViewController = ScreenPixViewController()
        coordinator.controller = screenPixViewController
        
        return screenPixViewController
    }
}
