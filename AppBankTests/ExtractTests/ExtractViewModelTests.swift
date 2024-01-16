//
//  ExtractViewModelTests.swift
//  AppBankTests
//
//  Created by Pedro Henrique on 12/01/24.
//

import XCTest
@testable import AppBank

class ExtractViewModelTests: XCTestCase {
    
    lazy var sut: ExtractViewModel = {
        let viewModel = ExtractViewModel(serviceViewModel: service, coordinator: coordinator)
        return viewModel
    }()
    
    private let service = ExtractServiceViewModelSpy()
    private let coordinator = ExtractCoordinatorSpy()
    
    func testLoadStatement_shouldCallLoadStatement() {
        sut.loadStatements()
        XCTAssertEqual(service.didCalledLoadStatement, true)
    }
}
