//
//  TransactionsFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/03/24.
//

import UIKit

enum TransactionsFactory {
    static func makeModule(navigationController: UINavigationController) -> TransactionsViewController {
        let service = ApiStatement()
        let model = ExtractModel()
        let serviceViewModel = ServiceViewModel(model: model, service: service)
        let coordinator = TransactionsCoordinator(navigationController: navigationController)
        let viewModel = TransactionsViewModel(serviceViewModel: serviceViewModel, coordinator: coordinator)
        let viewController = TransactionsViewController(viewModel: viewModel)
        viewModel.delegate = viewController
        return viewController
    }
}
