//
//  StatementViewModel.swift
//  AppBank
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
        var bankStatements = StatementsViewModel()
        ApiStatement.loadStatements { statements in
            for statement in statements {
                if let statementID = statement.id,
                   let statementType = statement.type,
                   let statementAbout = statement.about,
                   let statementAmount = statement.amount {
                    bankStatements.append(StatementViewModel(model: StatementModel(id: statementID, type: statementType, about: statementAbout, amount: statementAmount)))
                }
            }
            completion(bankStatements)
        }
    }
}
