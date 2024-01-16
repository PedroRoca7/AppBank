//
//  HomeSpies.swift
//  AppBankTests
//
//  Created by Pedro Henrique on 16/01/24.
//

import Foundation
@testable import AppBank

class HomeServiceViewModelSpy: ServiceViewModeling {
    private(set) var didCalledLoadStatement = false
    
    func loadStatement(completion: @escaping (Extratcts?) -> Void){
        didCalledLoadStatement = true
    }
}

class HomeCoordinatorSpy: HomeCoordinating {
    private(set) var didCalledShowPixScreen = false
    
    func startPixScreen() {
        didCalledShowPixScreen = true
    }
}
