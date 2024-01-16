//
//  LoginViewModelTests.swift
//  AppBankTests
//
//  Created by Pedro Henrique on 12/01/24.
//

import XCTest
@testable import AppBank


class LoginViewModelTests: XCTestCase {
  
    lazy var sut: LoginViewModel = {
        let viewModel = LoginViewModel(coordinator: coordinatorSpy)
        return viewModel
    }()
    
    let coordinatorSpy = LoginCoordinatorSpy()
    
    func testShowHomeScreen_shouldCallCoordinatorToOpenScreen() {
        // given
        let user = User(name: "Pedro", email: "pedro@gmail.com", password: "123456")
        // when
        sut.showHomeScreen(user: user)
        // then
        XCTAssertEqual(coordinatorSpy.didCalledStartTabController, true)
        XCTAssertEqual(coordinatorSpy.pushDetailsUserSpy, user)
    }
    
    func testShowRegisterScreen_shouldCallCoordinatorToOpenScreenRegister() {
        sut.showRegisterScreen()
        XCTAssertEqual(coordinatorSpy.didCalledStartRegisterScreen, true)
    }
}
