//
//  ScreenPixViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/10/23.
//

import Foundation

import UIKit

class ScreenPixViewController: UIViewController {
    
    lazy var viewScreen: ScreenPixView = {
        let view = ScreenPixView()
        return view
    }()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
    }
}
