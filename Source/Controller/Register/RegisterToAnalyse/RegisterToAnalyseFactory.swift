//
//  RegisterToAnalyseFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 18/03/24.
//

import UIKit

enum RegisterToAnalyseFactory {
    static func makeModule(navigationController: UINavigationController) -> UIViewController {
        let coordinator = RegisterToAnalyseCoordinator(navigationController: navigationController)
        let viewController = RegisterToAnalyseViewController(coordinator: coordinator)
        return viewController
    }
}
