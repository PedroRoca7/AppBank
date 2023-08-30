//
//  StatementViewController.swift
//  Itubers
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class StatementViewController: ViewControllerDefault {
    
    lazy var viewScreen: StatementView = {
        let view = StatementView()
        
        return view
    }()
    
    override func loadView() {
        self.view = viewScreen
    }
}
