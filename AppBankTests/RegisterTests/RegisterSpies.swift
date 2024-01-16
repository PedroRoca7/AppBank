//
//  RegisterSpies.swift
//  AppBankTests
//
//  Created by Pedro Henrique on 16/01/24.
//

import Foundation
@testable import AppBank

class RegisterCoordinatorSpy: RegisterCoordinating {
    private(set) var didCalledShowLoginScreen = false
    
    func showLoginScreen() {
        didCalledShowLoginScreen = true
    }
}
