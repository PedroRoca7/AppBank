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
        let serviceViewModel = ServiceViewModel(model: model, service: service)
        let extractViewModel = ExtractViewModel(statementViewModel: serviceViewModel)
        let extractViewController = ExtractViewController(viewModel: extractViewModel)
        extractViewModel.delegate = extractViewController
        
        return extractViewController
    }
}
