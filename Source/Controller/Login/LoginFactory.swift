//
//  LoginFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/11/23.
//

import Foundation
import UIKit

enum LoginFactory {
    static func makeModule() -> UIViewController {
        let coordinator = LoginCoordinator()
        let loginViewModel = LoginViewModel(coordinator: coordinator)
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        loginViewModel.delegate = loginViewController
        coordinator.controller = loginViewController
        return loginViewController
    }
}
