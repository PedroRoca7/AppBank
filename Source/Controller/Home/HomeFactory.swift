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
        let coordinator = HomeCoordinator(navigationController: navigationController)
        let serviceViewModel = ServiceViewModel(model: model, service: service)
        let homeViewModel = HomeViewModel(serviceViewModel: serviceViewModel, coordinator: coordinator)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        homeViewModel.delegate = homeViewController
        coordinator.controller = homeViewController
        homeViewController.user = user
        
        return homeViewController
    }
}
