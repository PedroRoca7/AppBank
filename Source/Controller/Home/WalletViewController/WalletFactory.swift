//
//  WalletFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 19/03/24.
//

import UIKit

enum WalletFactory {
    static func makeModule() -> UIViewController {
        let viewController =  WalletViewController()
        return viewController
    }
}
