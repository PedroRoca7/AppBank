//
//  CreditCardViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import Foundation
import UIKit

final class CreditCardViewController: UIViewController {
    
    lazy var viewScreen: CreditCardView = {
        let element = CreditCardView()
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
