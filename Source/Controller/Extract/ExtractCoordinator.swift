//
//  ExtractCoordinatoor.swift
//  AppBank
//
//  Created by Pedro Henrique on 14/11/23.
//

import Foundation
import UIKit

protocol ExtractCoordinating {
    
}

class ExtractCoordinatoor: ExtractCoordinating {
    
    //MARK: Propertys
    
    weak var controller: UIViewController?
    private var navigationController: UINavigationController
    
    //MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
