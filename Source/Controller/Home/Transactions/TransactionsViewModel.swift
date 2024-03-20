//
//  ExtractViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 04/09/23.
//

import Foundation

protocol TransactionsViewModelProtocol: AnyObject {
    func success()
    func failure()
}

protocol TransactionsViewModeling: AnyObject {
    var delegate: TransactionsViewModelProtocol? { get set }
    var bankStatements: Extratcts { get }
    func loadStatements()
}

class TransactionsViewModel: TransactionsViewModeling {
    
    //MARK: Propertys
    var bankStatements: Extratcts = []
    private var bankStatementsAll: Extratcts = []
    private var serviceViewModel: ServiceViewModeling
    weak var delegate: TransactionsViewModelProtocol?
    
    //MARK: Init
    
    init(serviceViewModel: ServiceViewModeling) {
        self.serviceViewModel = serviceViewModel
    }
   
    //MARK: Methods
        
    public func loadStatements() {
        serviceViewModel.loadStatement { [weak self] result in
            guard let self = self else { return }
            if let result = result {
                self.bankStatements = result
                self.bankStatementsAll = result
                self.delegate?.success()
            } else {
                self.delegate?.failure()
            }
        }
    }
}
