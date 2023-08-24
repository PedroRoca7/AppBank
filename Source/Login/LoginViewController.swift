//
//  LoginViewController.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class LoginViewController: ViewControllerDefault {
    
    lazy var viewScreen: LoginView = {
        let view = LoginView()
        
        return view
    }()
    
    override func loadView() {
        self.view = viewScreen
    }
}
