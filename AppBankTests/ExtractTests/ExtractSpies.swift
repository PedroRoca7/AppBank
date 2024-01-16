//
//  ExtractSpies.swift
//  AppBankTests
//
//  Created by Pedro Henrique on 16/01/24.
//

import Foundation
@testable import AppBank

class ExtractServiceViewModelSpy: ServiceViewModeling {
    private(set) var didCalledLoadStatement = false
    
    func loadStatement(completion: @escaping (Extratcts?) -> Void) {
        didCalledLoadStatement = true
    }
}

class ExtractCoordinatorSpy: ExtractCoordinating {
    
}
