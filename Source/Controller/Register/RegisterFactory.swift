//
//  RegisterFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/11/23.
//

import Foundation
import UIKit

enum RegisterFactory {
    static func makeModule(navigationController: UINavigationController) -> RegisterViewController {
        let coordinator = RegisterCoordinatoor(navigationController: navigationController)
        let registerViewModel = RegisterViewModel(coordinator: coordinator)
        let registerViewController = RegisterViewController(viewModel: registerViewModel)
        registerViewModel.delegate = registerViewController
        coordinator.controller = registerViewController
        
        return registerViewController
    }
}
