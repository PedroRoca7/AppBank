//
//  TransfersFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

enum TransfersFactory {
    static func makeModule(navigationController: UINavigationController) -> UIViewController {
        let viewController = TransfersViewController()
        return viewController
    }
}
