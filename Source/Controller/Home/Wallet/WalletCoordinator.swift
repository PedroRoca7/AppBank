//
//  WalletCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 22/03/24.
//

import UIKit

final class WalletCoordinator {
    
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
    
}
