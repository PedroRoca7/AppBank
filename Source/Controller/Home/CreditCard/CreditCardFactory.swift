//
//  CreditCardFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import UIKit

enum CreditCardFactory {
    static func makeModule() -> CreditCardViewController {
        let viewController = CreditCardViewController()
        return viewController
    }
}
