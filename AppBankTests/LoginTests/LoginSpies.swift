//
//  LoginSpies.swift
//  AppBankTests
//
//  Created by Pedro Henrique on 16/01/24.
//

import Foundation
@testable import AppBank

class LoginCoordinatorSpy: LoginCoordinating {
    
    private(set) var didCalledStartTabController = false
    private(set) var pushDetailsUserSpy: User?
    private(set) var didCalledStartRegisterScreen = false
    
    func startTabController(user: User) {
        didCalledStartTabController = true
        pushDetailsUserSpy = user
    }
    
    func startRegisterScreen() {
        didCalledStartRegisterScreen = true
    }
}
