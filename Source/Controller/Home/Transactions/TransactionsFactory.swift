//
//  TransactionsFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/03/24.
//

import UIKit

enum TransactionsFactory {
    static func makeModule() -> TransactionsViewController {
        let service = ApiStatement()
        let model = ExtractModel()
        let serviceViewModel = ServiceViewModel(model: model, service: service)
        let viewModel = TransactionsViewModel(serviceViewModel: serviceViewModel)
        let viewController = TransactionsViewController(viewModel: viewModel)
        viewModel.delegate = viewController
        return viewController
    }
}
