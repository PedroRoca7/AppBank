//
//  ExtractViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 04/09/23.
//

import Foundation

protocol ExtractViewModelProtocol: AnyObject {
    func success(balance: Double)
    func failure()
}

protocol ExtractViewModeling: AnyObject {
    var delegate: ExtractViewModelProtocol? { get set }
    var bankStatements: Extratcts { get }
    func loadStatements()
    func filterExtract(index: Int)
}

class ExtractViewModel: ExtractViewModeling {
    
    //MARK: Propertys
    var bankStatements: Extratcts = []
    private var bankStatementsAll: Extratcts = []
    private var serviceViewModel: ServiceViewModeling
    private var coordinator: ExtractCoordinating
    weak var delegate: ExtractViewModelProtocol?
    
    //MARK: Init
    
    init(serviceViewModel: ServiceViewModeling, coordinator: ExtractCoordinating) {
        self.serviceViewModel = serviceViewModel
        self.coordinator = coordinator
    }
   
    //MARK: Methods
    
    private func currentBalance() {
        var balance: Double = 0
        for value in bankStatementsAll {
            balance += value.amout
        }
        self.delegate?.success(balance: balance)
    }
    
    public func loadStatements() {
        serviceViewModel.loadStatement { [weak self] result in
            guard let self = self else { return }
            if let result = result {
                self.bankStatements = result
                self.bankStatementsAll = result
                self.currentBalance()
            } else {
                self.delegate?.failure()
            }
        }
    }
    
    public func filterExtract(index: Int) {
        switch index {
            case 0:
                bankStatements = bankStatementsAll.filter { $0.type == TypeEntry.Input}
                currentBalance()
            case 2:
                bankStatements = bankStatementsAll.filter { $0.type == TypeEntry.Output}
                currentBalance()
            default:
                bankStatements = bankStatementsAll
                currentBalance()
        }
   
    }
}
