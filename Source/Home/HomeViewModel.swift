//
//  HomeViewModel.swift
//  Itubers
//
//  Created by Pedro Henrique on 25/08/23.
//

import Foundation

class HomeViewModel {
    
    var statements: StatementsViewModel = []
    
    func loadStatements() {
        statements = StatementViewModel.mock()
    }
    
    func currentBalance() -> Int {
        var balance = 0
        for statement in statements {
            balance += statement.amout
        }
        return balance
    }
}
