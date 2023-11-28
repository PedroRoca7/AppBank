//
//  RegisterCoordinator.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/11/23.
//

import Foundation
import UIKit

protocol RegisterCoordinating {
    func showLoginScreen()
}

class RegisterCoordinator: RegisterCoordinating {
    
    //MARK: Propertys

    weak var controller: UIViewController?
    
    //MARK: Init
    
    public func showLoginScreen() {
        controller?.navigationController?.popToRootViewController(animated: true)
    }
}
