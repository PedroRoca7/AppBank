//
//  MyDataFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import Foundation

enum MyDataFactory {
    static func makeModule() -> MyDataViewController {
        let viewController = MyDataViewController()
        return viewController
    }
}
