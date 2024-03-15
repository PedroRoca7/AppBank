//
//  RegisterEmailFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 15/03/24.
//

import Foundation
import UIKit

enum RegisterEmailFactory {
    static func makemodule(navigationController: UINavigationController, nameUser: String) -> UIViewController {
        let coordinator = RegisterEmailCoordinator(navigationController: navigationController)
        let viewController = RegisterEmailViewController(nameUser: nameUser, coordinator: coordinator)
        return viewController
    }
}
