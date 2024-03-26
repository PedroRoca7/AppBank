//
//  TransfersViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit
import RxCocoa
import RxSwift

final class TransfersViewController: UIViewController {
    
    // MARK: - Propertys
    
    private let disposeBag = DisposeBag()
    
    lazy var viewScreen: TransfersView = {
        let element = TransfersView()
        return element
    }()
        
    private var coordinator: TransfersCoordinating
    
    init(coordinator: TransfersCoordinating) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewScreen
    }
        
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedPixButton()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "Transferência"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationItem.title = ""
    }
    
    private func tappedPixButton() {
        viewScreen.pixButton.button.rx.tap.bind {
            self.coordinator.showPixScreen()
        }.disposed(by: disposeBag)
    }
}
