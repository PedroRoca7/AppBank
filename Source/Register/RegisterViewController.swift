//
//  RegisterViewController.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class RegisterViewController: ViewControllerDefault {
    
    lazy var viewScreen: RegisterView = {
        let view = RegisterView()
        
        return view
    }()
    
    override func loadView() {
        self.view = viewScreen
    }
}
