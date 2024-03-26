//
//  MyAccountFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import Foundation

enum MyAccountFactory {
    static func makeModule() -> MyAccountViewController {
        let viewController = MyAccountViewController()
        return viewController
    }
}
