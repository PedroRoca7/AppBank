//
//  ExtractFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 08/11/23.
//

import Foundation
import UIKit

enum ExtractFactory {
    static func makeModule(navigationController: UINavigationController) -> UIViewController {
        let service = ApiStatement()
        let model = ExtractModel()
        let coordinator = ExtractCoordinator(navigationController: navigationController)
        let serviceViewModel = ServiceViewModel(model: model, service: service)
        let extractViewModel = ExtractViewModel(serviceViewModel: serviceViewModel, coordinator: coordinator)
        let extractViewController = ExtractViewController(viewModel: extractViewModel)
        extractViewModel.delegate = extractViewController
        
        return extractViewController
    }
}
