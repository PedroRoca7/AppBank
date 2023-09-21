//
//  ProductsViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class ProductsViewController: ViewControllerDefault {
    
    lazy var viewScreen: ProductsView = {
        let view = ProductsView()
        
        return view
    }()
    
    override func loadView() {
        self.view = viewScreen
    }
}
