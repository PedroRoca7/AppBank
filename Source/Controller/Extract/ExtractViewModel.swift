//
//  ExtractViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 04/09/23.
//

import Foundation

protocol ExtractViewModelProtocol: AnyObject {
    func success()
    func failure()
}

protocol ExtractViewModeling: AnyObject {
    var delegate: ExtractViewModelProtocol? { get set }
    var bankStatements: Extratcts { get }
    func loadStatements()
    func currentBalance() -> Double
}

class ExtractViewModel: ExtractViewModeling {
    var user: User
    var bankStatements: Extratcts = []
    private var serviceViewModel: ServiceViewModel
    private var coordinator: HomeCoordinating
    weak var delegate: ExtractViewModelProtocol?
    
    init(serviceViewModel: ServiceViewModel, coordinator: HomeCoordinating) {
        self.serviceViewModel = serviceViewModel
        self.coordinator = coordinator
    }
   
    func loadStatements() {
        serviceViewModel.loadStatement { [weak self] result in
            guard let self = self else { return }
            if let result = result {
                self.bankStatements = result
            }
            self.delegate?.success()
        }
    }
    
     func currentBalance() -> Double {
        var balance: Double = 0
        for bankStatement in bankStatements {
            balance += bankStatement.amout
        }
        return balance
    }
}
