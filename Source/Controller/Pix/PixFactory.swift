//
//  PixFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 26/03/24.
//

import UIKit

enum PixFactory {
    static func makeModule(navigationController: UINavigationController) -> UIViewController {
        let service = ApiStatement()
        let model = ExtractModel()
        let serviceViewModel = ServiceViewModel(model: model, service: service)
        let viewModel = PixViewModel(serviceViewModel: serviceViewModel)
        let viewController = PixViewController(viewModel: viewModel)
        viewModel.delegate = viewController
        return viewController
    }
}
