//
//  ProductsFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 14/11/23.
//

import Foundation
import UIKit

enum ProductsFactory {
    static func makeModule() -> UIViewController {
        let coordinator = ProductsCoordinator()
        let productsViewController = ProductsViewController()
        coordinator.controller = productsViewController
        return productsViewController
    }
}
