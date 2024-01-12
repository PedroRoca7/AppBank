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
    
    private let service = ExtractServiceViewModel()
    private let coordinator = ExtractCoordinator()
    
    func testLoadStatement_shouldCallLoadStatement() {
        sut.loadStatements()
        XCTAssertEqual(service.didCalledLoadStatement, true)
    }
}

class ExtractServiceViewModel: ServiceViewModeling {
    private(set) var didCalledLoadStatement = false
    
    func loadStatement(completion: @escaping (Extratcts?) -> Void) {
        didCalledLoadStatement = true
    }
}

class ExtractCoordinator: ExtractCoordinating {
    
}
