//
//  ServiceViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 28/08/23.
//

import Foundation

typealias Extratcts = [ServiceViewModel]

class ServiceViewModel {
    private let model: ExtratcModel
    private let service: ApiStatement
    
    //MARK: Inits
    
    init(model: ExtratcModel, service: ApiStatement = ApiStatement.serviceGetExtract) {
        self.model = model
        self.service = service
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
    
    func loadStatement(completion: @escaping (Extratcts?) -> Void) {
        var bankStatements = Extratcts()
        service.loadStatements { statements in
            for statement in statements {
                if let statementID = statement.id,
                   let statementType = statement.type,
                   let statementAbout = statement.about,
                   let statementAmount = statement.amount {
                    bankStatements.append(ServiceViewModel(model: ExtratcModel(id: statementID, type: statementType, about: statementAbout, amount: statementAmount)))
                }
            }
            completion(bankStatements)
        }
    }
}
