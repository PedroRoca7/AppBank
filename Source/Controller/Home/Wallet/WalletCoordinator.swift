//
//  WalletCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 22/03/24.
//

import UIKit

protocol WalletCoordinating {
    func showInsertMoneyScreen()
    func showTransferScreen()
}

final class WalletCoordinator: WalletCoordinating {
    
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
