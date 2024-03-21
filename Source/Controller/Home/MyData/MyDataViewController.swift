//
//  MyDataViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import Foundation
import UIKit

final class MyDataViewController: UIViewController {
    
    lazy var viewScreen: MyDataView = {
        let element = MyDataView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
        
    override func loadView() {
        view = viewScreen
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
