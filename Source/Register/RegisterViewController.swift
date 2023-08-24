//
//  RegisterViewController.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class RegisterViewController: ViewControllerDefault {
    
    // MARK: Propertys
    
    lazy var viewScreen: RegisterView = {
        let view = RegisterView()
        
        return view
    }()
    
    // MARK: Inits
    
    override func loadView() {
        self.view = viewScreen
    }
}
