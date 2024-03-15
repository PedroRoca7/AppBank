//
//  RegisterFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/11/23.
//

import Foundation
import UIKit

enum RegisterNameFactory {
    static func makeModule(navigationController: UINavigationController) -> UIViewController {
        let coordinator = RegisterNameCoordinator(navigationController: navigationController)
        let viewController = RegisterNameViewController(coordinator: coordinator)
        return viewController
    }
}
