//
//  HomeFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 08/11/23.
//

import Foundation
import UIKit

enum HomeFactory {
    static func makeModule(navigationController: UINavigationController ,user: User) -> UIViewController {
        let service = ApiStatement()
        let model = ExtratcModel()
        let coordinator = HomeCoordinatoor(navigationController: navigationController)
        let serviceViewModel = ServiceViewModel(model: model, service: service)
        let extractViewModel = ExtractViewModel(serviceViewModel: serviceViewModel, coordinator: coordinator)
        let homeViewController = HomeViewController(viewModel: extractViewModel)
        extractViewModel.delegate = homeViewController
        coordinator.controller = homeViewController
        homeViewController.user = user
        
        return homeViewController
    }
}
