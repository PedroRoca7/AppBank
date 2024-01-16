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
    let coordinator = ScreenPixCoordinatorSpy()
    
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
