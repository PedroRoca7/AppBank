//
//  RegisterToAnalyseViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 18/03/24.
//

import UIKit
import RxSwift
import RxCocoa

final class RegisterToAnalyseViewController: UIViewController {
    
    lazy var viewScreen: RegisterToAnalyseView = {
        let element = RegisterToAnalyseView()
        return element
    }()
    
    private let disposeBag = DisposeBag()
    private var coordinator: RegisterToAnalyseCoordinating
    
    init(coordinator: RegisterToAnalyseCoordinating) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedExitButton()
    }
    
    private func tappedExitButton() {
        viewScreen.exitButton.rx.tap.bind {
            self.coordinator.showLoginScreen()
        }.disposed(by: disposeBag)
    }
    
}
