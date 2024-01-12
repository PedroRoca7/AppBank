//
//  ScreenPixViewModelTests.swift
//  AppBankTests
//
//  Created by Pedro Henrique on 12/01/24.
//

import XCTest
@testable import AppBank

class ScreenPixViewModelTests: XCTestCase {
    
    lazy var sut: ScreenPixViewModel = {
        let viewModel = ScreenPixViewModel(serviceViewModel: service, coordinator: coordinator)
        return viewModel
    }()
    
    let service = ScreenPixServiceViewModelSpy()
    let coordinator = ScreenPixCoordinator()
    
    func testMakePix_shouldCallMakePix() {
        let intRandom = Int.random(in: 0..<10)
        let doubleRandom = Double.random(in: 0..<10)
        let stringRandom = UUID().uuidString
        let extract = ExtractModel(id: intRandom, type: intRandom, about: stringRandom, amount: doubleRandom)
        
        sut.makePix(modelInformations: extract)
        
        XCTAssertEqual(service.didCalledMakePix, true)
        XCTAssertEqual(service.pushDetailsExtractInforations, extract)
    }
    
    func testShowHomeScreen_shouldCallCoordinatorShowHomeScreen() {
        sut.showHomeScreen()
        
        XCTAssertEqual(coordinator.didCalledShowHomeScreen, true)
    }
    
}

class ScreenPixServiceViewModelSpy: ServiceViewModeling {
    private(set) var didCalledMakePix = false
    private(set) var pushDetailsExtractInforations: ExtractModel?
    
    func makePix(modelInformations: ExtractModel, onComplete: @escaping (Bool) -> Void) {
        didCalledMakePix = true
        pushDetailsExtractInforations = modelInformations
    }
}

class ScreenPixCoordinator: ScreenPixCoordinating {
    private(set) var didCalledShowHomeScreen = false
    
    func showHomeScreen() {
        didCalledShowHomeScreen = true
    }
}
