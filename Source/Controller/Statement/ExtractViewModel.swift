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

class ExtractViewModel {
    
    var bankStatements: StatementsViewModel = []
    weak var delegate: ExtractViewModelProtocol?
   
    
    func loadStatements() {
        StatementViewModel.loadStatement { [weak self] result in
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
