//
//  HomeFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 08/11/23.
//

import Foundation
import UIKit

enum HomeFactory {
    static func makeModule() -> HomeViewController {
        let service = ApiStatement()
        let model = ExtratcModel()
        let serviceViewModel = ServiceViewModel(model: model, service: service)
        let extractViewModel = ExtractViewModel(statementViewModel: serviceViewModel)
        let homeViewController = HomeViewController(viewModel: extractViewModel)
        extractViewModel.delegate = homeViewController
        
        return homeViewController
    }
}
