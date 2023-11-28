//
//  HomeCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/11/23.
//

import Foundation
import UIKit

protocol HomeCoordinating {
    
}

class HomeCoordinator: HomeCoordinating {
    
    //MARK: Propertys
    
    var navigationController: UINavigationController
    
    //MARK: Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}
