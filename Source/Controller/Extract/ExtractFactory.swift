//
//  ExtractFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 08/11/23.
//

import Foundation
import UIKit

enum ExtractFactory {
    static func makeModule() -> UIViewController {
        let service = ApiStatement()
        let model = ExtratcModel()
        let coordinator = ExtractCoordinator()
        let serviceViewModel = ServiceViewModel(model: model, service: service)
        let extractViewModel = ExtractViewModel(serviceViewModel: serviceViewModel, coordinator: coordinator)
        let extractViewController = ExtractViewController(viewModel: extractViewModel)
        extractViewModel.delegate = extractViewController
        coordinator.controller = extractViewController
        
        return extractViewController
    }
}
