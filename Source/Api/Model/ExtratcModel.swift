//
//  ExtratcModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 28/08/23.
//

import Foundation

typealias ExtractsModel = [ExtratcModel]

struct ExtratcModel: Codable {
    let id: Int?
    let type: Int?
    let about: String?
    let amount: Double?
    
    init() {
        self.id = 0
        self.type = 0
        self.about = String.empty
        self.amount = 0
    }
    
    init(id: Int, type: Int, about: String, amount: Double) {
        self.id = id
        self.type = type
        self.about = about
        self.amount = amount
    }
    
}
