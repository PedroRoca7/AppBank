//
//  RegisterPasswordFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 18/03/24.
//

import UIKit

enum RegisterPasswordFactory {
    static func makeModule(navigationController: UINavigationController, nameUser: String, emailUser: String) -> UIViewController {
        let coordinator = RegisterPasswordCoordinator(navigationController: navigationController)
        let viewModel = RegisterPasswordViewModel(coordinator: coordinator)
        let viewController = RegisterPasswordViewController(nameUser: nameUser, emailUser: emailUser, viewModel: viewModel)
        
        viewModel.delegate = viewController
        return viewController
    }
}
