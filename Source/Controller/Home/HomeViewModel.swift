//
//  HomeViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 22/11/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func success(balance: Double)
    func failure()
}

protocol HomeViewModeling: AnyObject {
    var bankStatements: Extratcts { get }
    func currentBalance()
    var delegate: HomeViewModelProtocol? { get set }
}

class HomeViewModel: HomeViewModeling {
    
    //MARK: Propertys
    
    var bankStatements: Extratcts = []
    private var serviceViewModel: ServiceViewModel
    private var coordinator: HomeCoordinator
    weak var delegate: HomeViewModelProtocol?
    
    //MARK: Init
    
    init(serviceViewModel: ServiceViewModel, coordinator: HomeCoordinator) {
        self.serviceViewModel = serviceViewModel
        self.coordinator = coordinator
    }
    
    private func loadStatements(onComplete: @escaping (Bool) -> Void ) {
        serviceViewModel.loadStatement { [weak self] result in
            guard let self = self else { return }
            if let result = result {
                self.bankStatements = result
            } else {
                self.delegate?.failure()
            }
        }
    }
    
    func currentBalance() {
        loadStatements { [weak self] result in
            guard let self = self else { return }
            if result {
                var balance: Double = 0
                for bankStatement in self.bankStatements {
                    balance += bankStatement.amout
                }
                self.delegate?.success(balance: balance)
            } else {
                self.delegate?.failure()
            }
        }
    }
}
