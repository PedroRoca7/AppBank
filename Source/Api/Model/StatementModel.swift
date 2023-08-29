//
//  StatementModel.swift
//  Itubers
//
//  Created by Pedro Henrique on 28/08/23.
//

import Foundation

typealias StatementsModel = [StatementModel]

struct StatementModel: Codable {
    let id: Int?
    let type: Int?
    let about: String?
    let amount: Int?
    
    init() {
        self.id = 0
        self.type = 0
        self.about = String.empty
        self.amount = 0
    }
    
    init(id: Int, type: Int, about: String, amount: Int) {
        self.id = id
        self.type = type
        self.about = about
        self.amount = amount
    }
    
}
