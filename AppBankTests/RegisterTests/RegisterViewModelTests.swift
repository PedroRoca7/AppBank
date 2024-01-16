//
//  RegisterViewModelTests.swift
//  AppBankTests
//
//  Created by Pedro Henrique on 12/01/24.
//

import XCTest
@testable import AppBank

class RegisterViewModelTests: XCTestCase {
    
    lazy var sut: RegisterViewModel = {
        let viewModel = RegisterViewModel(coordinator: coordinator)
        return viewModel
    }()
    
    let coordinator = RegisterCoordinatorSpy()
    
        
    func testShowLoginScreen_shouldCallCoordinatorShowLoginScreen() {
        sut.showLoginScreen()
        XCTAssertEqual(coordinator.didCalledShowLoginScreen, true)
    }
}
