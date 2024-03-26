//
//  TransfersFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

enum TransfersFactory {
    static func makeModule(navigationController: UINavigationController) -> UIViewController {
        let coordinator = TransfersCoordinator(navigationController: navigationController)
        let viewController = TransfersViewController(coordinator: coordinator)
        return viewController
    }
}
