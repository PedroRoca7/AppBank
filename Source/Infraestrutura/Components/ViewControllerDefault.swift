//
//  ViewControllerDefault.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class ViewControllerDefault: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
    }
    
    func hideKeyBoardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

