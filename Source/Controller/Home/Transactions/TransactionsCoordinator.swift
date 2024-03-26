//
//  TransactionsCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

protocol TransactionsCoordinating {
    func showInsertMoneyScreen()
    func showTransferScreen()
}

final class TransactionsCoordinator: TransactionsCoordinating {
    
    //MARK: Propertys
    
    var navigationController: UINavigationController
    
    //MARK: Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func showInsertMoneyScreen() {
        let insertMoneyView = InsertMoneyFactory.makeModule(navigationController: navigationController)
        navigationController.pushViewController(insertMoneyView, animated: true)
    }
    
    public func showTransferScreen() {
        let transferView = TransfersFactory.makeModule(navigationController: navigationController)
        navigationController.pushViewController(transferView, animated: true)
    }
}
