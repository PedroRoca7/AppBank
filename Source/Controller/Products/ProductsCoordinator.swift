//
//  ProductsCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 14/11/23.
//

import Foundation
import UIKit

protocol ProductsCoordinating {
    
}

class ProductsCoordinator: ProductsCoordinating {
    
    //MARK: Propertys
    
    weak var controller: UIViewController?
    private var navigationController: UINavigationController
    
    //MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
