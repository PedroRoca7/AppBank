//
//  ScreenPixFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 14/11/23.
//

import Foundation
import UIKit

enum ScreenPixFactory {
    static func makeModule(navigationController: UINavigationController) -> UIViewController {
        let service = ApiStatement()
        let model = ExtractModel()
        let coordinator = ScreenPixCoordinator(navigationController: navigationController)
        let serviceViewModel = ServiceViewModel(model: model, service: service)
        let screenPixViewModel = ScreenPixViewModel(serviceViewModel: serviceViewModel, coordinator: coordinator)
        let screenPixViewController = ScreenPixViewController(viewModel: screenPixViewModel)
        screenPixViewModel.delegate = screenPixViewController
        
        return screenPixViewController
    }
}
