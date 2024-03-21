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
    func loadStatements()
    func showPixScreen()
    var delegate: HomeViewModelProtocol? { get set }
    var bankExtracts: Extratcts { get }
}

class HomeViewModel: HomeViewModeling {
    
    //MARK: Propertys
    
    var bankExtracts: Extratcts = []
    private var serviceViewModel: ServiceViewModeling
    private var coordinator: HomeCoordinating
    weak var delegate: HomeViewModelProtocol?
    
    //MARK: Init
    
    init(serviceViewModel: ServiceViewModeling, coordinator: HomeCoordinating) {
        self.serviceViewModel = serviceViewModel
        self.coordinator = coordinator
    }
    
    public func loadStatements() {
        serviceViewModel.loadStatement { [weak self] result in
            guard let self = self else { return }
            if let result = result {
                self.bankExtracts = result
                self.currentBalance()
            } else {
                self.delegate?.failure()
            }
        }
    }
    
    public func showPixScreen() {
        coordinator.startPixScreen()
    }
    
    private func currentBalance() {
        var balance: Double = 0
        for bankStatement in bankExtracts {
            balance += bankStatement.amout
        }
        self.delegate?.success(balance: balance)
    }
}
