//
//  StatementViewModel.swift
//  Itubers
//
//  Created by Pedro Henrique on 28/08/23.
//

import Foundation

typealias StatementsViewModel = [StatementViewModel]

class StatementViewModel {
    let model: StatementModel
    
    
    init(model: StatementModel) {
        self.model = model
    }
    
    var id: Int {
        model.id ?? 0
    }
    
    var type: TypeEntry {
        model.type == 0 ? TypeEntry.Input : TypeEntry.Output
    }
    
    var about: String {
        model.about ?? String.empty
    }
    
    var amout: Double {
        model.amount ?? 0
    }
    
    static func loadStatement(completion: @escaping (StatementsViewModel?) -> Void) {
        var mocks = StatementsViewModel()
        ApiStatement.loadStatements { statements in
            for statement in statements {
                if let statementID = statement.id,
                   let statementType = statement.type,
                   let statementAbout = statement.about,
                   let statementAmount = statement.amount {
                    mocks.append(StatementViewModel(model: StatementModel(id: statementID, type: statementType, about: statementAbout, amount: statementAmount)))
                }
            }
            completion(mocks)
        }
    }
    
    static func mock() -> StatementsViewModel {
        var mocks = StatementsViewModel()
        
        mocks.append(StatementViewModel(model: StatementModel(id: 1, type: 1, about: "Conta de luz", amount: -190)))
        mocks.append(StatementViewModel(model: StatementModel(id: 1, type: 0, about: "Salário do mês", amount: 1900)))
        mocks.append(StatementViewModel(model: StatementModel(id: 1, type: 1, about: "Conta de Água", amount: -85.99)))
        mocks.append(StatementViewModel(model: StatementModel(id: 1, type: 1, about: "Internet", amount: -119.90)))
        mocks.append(StatementViewModel(model: StatementModel(id: 1, type: 1, about: "Supermecado Barbosa", amount: -163.74)))
        
        
        return mocks
    }
}
