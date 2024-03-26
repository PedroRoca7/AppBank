//
//  MyDataViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

final class MyDataViewController: UIViewController {
    
    lazy var viewScreen: MyDataView = {
        let element = MyDataView()
        return element
    }()
        
    override func loadView() {
        view = viewScreen
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "Meus dados"
        navigationController?.navigationBar.tintColor = .black
    }
}
