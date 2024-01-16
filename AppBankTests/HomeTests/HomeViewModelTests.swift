//
//  HomeViewModelTests.swift
//  AppBankTests
//
//  Created by Pedro Henrique on 12/01/24.
//

import XCTest
@testable import AppBank

class HomeViewModelTests: XCTestCase {
    
    lazy var sut: HomeViewModel = {
        let viewModel = HomeViewModel(serviceViewModel: serviceViewModel, coordinator: coordinator)
        return viewModel
    }()
    
    let serviceViewModel = HomeServiceViewModelSpy()
    let coordinator = HomeCoordinatorSpy()
    
    func testLoadStatement_shouldCallServiceViewModelLoadStatement() {
        sut.loadStatements()
        XCTAssertEqual(serviceViewModel.didCalledLoadStatement, true)
    }
 
    func testStartPixScreen_shouldCallCoordinatorStartPixScreen() {
        sut.showPixScreen()
        XCTAssertEqual(coordinator.didCalledShowPixScreen, true)
    }
    
}
