//
//  ScreenPixSpies.swift
//  AppBankTests
//
//  Created by Pedro Henrique on 16/01/24.
//

import Foundation
@testable import AppBank

class ScreenPixServiceViewModelSpy: ServiceViewModeling {
    private(set) var didCalledMakePix = false
    private(set) var pushDetailsExtractInforations: ExtractModel?
    
    func makePix(modelInformations: ExtractModel, onComplete: @escaping (Bool) -> Void) {
        didCalledMakePix = true
        pushDetailsExtractInforations = modelInformations
    }
}

class ScreenPixCoordinatorSpy: ScreenPixCoordinating {
    private(set) var didCalledShowHomeScreen = false
    
    func showHomeScreen() {
        didCalledShowHomeScreen = true
    }
}
