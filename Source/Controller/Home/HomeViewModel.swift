//
//  HomeViewModel.swift
//  Itubers
//
//  Created by Pedro Henrique on 25/08/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func failure()
}

class HomeViewModel {
    weak var delegate: HomeViewModelProtocol?
    var statements: StatementsViewModel = []
    
    func loadStatements() {
        StatementViewModel.loadStatement { [weak self] result in
            guard let self = self else { return }
            if let result = result {
                self.statements = result
            }
            self.delegate?.success()
        }
    }
    
    func currentBalance() -> Double {
        var balance: Double = 0
        for statement in statements {
            balance += statement.amout
        }
        return balance
    }
}
