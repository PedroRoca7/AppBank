//
//  HomeViewController.swift
//  Itubers
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

class HomeViewController: ViewControllerDefault {
    
    // MARK: Propertys
    var user: User?
    lazy var viewScreen: HomeView = {
        let view = HomeView()
        
        return view
    }()
    
    // MARK: Inits
    override func loadView() {
        self.view = viewScreen
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.nameLabel.text = user?.name
    }
}
