//
//  TransfersViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

final class TransfersViewController: UIViewController {
    
    lazy var viewScreen: TransfersView = {
        let element = TransfersView()
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
        navigationController?.navigationBar.topItem?.title = "Transferência"
        navigationController?.navigationBar.tintColor = .black
    }
}
