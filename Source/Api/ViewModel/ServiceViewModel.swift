//
//  ServiceViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 28/08/23.
//

import Foundation

typealias Extratcts = [ServiceViewModel]

protocol ServiceViewModeling: AnyObject {
    func loadStatement(completion: @escaping (Extratcts?) -> Void)
    func makePix(modelInformations: ExtractModel, onComplete: @escaping (Bool) -> Void)
}

extension ServiceViewModeling {
    func loadStatement(completion: @escaping (Extratcts?) -> Void){}
    func makePix(modelInformations: ExtractModel, onComplete: @escaping (Bool) -> Void){}
}

class ServiceViewModel: ServiceViewModeling {
    private let model: ExtractModel
    private let service: ApiStatement
    
    //MARK: Inits
    
    init(model: ExtractModel, service: ApiStatement = ApiStatement.serviceGetExtract) {
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
    
    public func loadStatement(completion: @escaping (Extratcts?) -> Void) {
        var bankStatements = Extratcts()
        service.loadStatements { statements in
            for statement in statements {
                if let statementID = statement.id,
                   let statementType = statement.type,
                   let statementAbout = statement.about,
                   let statementAmount = statement.amount {
                    bankStatements.append(ServiceViewModel(model: ExtractModel(id: statementID, type: statementType, about: statementAbout, amount: statementAmount)))
                }
            }
            completion(bankStatements)
        }
    }
    
    public func makePix(modelInformations: ExtractModel, onComplete: @escaping (Bool) -> Void) {
        service.updateStatements(extractInformations: modelInformations) { result in
            if result == true {
                onComplete(true)
            } else {
                onComplete(false)
            }
        }
    }
    
}
