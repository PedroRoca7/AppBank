//
//  InsertMoneyFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 14/11/23.
//

import UIKit

enum InsertMoneyFactory {
    static func makeModule(navigationController: UINavigationController) -> UIViewController {
        let coordinator = InsertMoneyCoordinator(navigationController: navigationController)
        let viewController = InsertMoneyViewController(coordinator: coordinator)
        return viewController
    }
}
