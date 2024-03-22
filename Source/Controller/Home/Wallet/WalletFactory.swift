//
//  WalletFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 19/03/24.
//

import UIKit

enum WalletFactory {
    static func makeModule(navigationController: UINavigationController) -> WalletViewController {
        let coordinator = WalletCoordinator(navigationController: navigationController)
        let viewController =  WalletViewController(coordinator: coordinator)
        return viewController
    }
}
