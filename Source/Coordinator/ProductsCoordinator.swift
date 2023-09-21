//
//  ProductsCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class ProductsCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    lazy var productsViewController: ProductsViewController = {
        let viewController = ProductsViewController()
        viewController.tabBarItem.image = UIImage(systemName: "envelope.fill")
        viewController.tabBarItem.title = "Produtos"
        return viewController
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    }
    
    
}
