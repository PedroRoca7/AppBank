//
//  RegisterViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterNameViewController: UIViewController {
    
    // MARK: Propertys
    private let disposeBag = DisposeBag()
   
    private lazy var viewScreen: RegisterNameView = {
        let view = RegisterNameView()
        return view
    }()
    
    private var coordinator: RegisterNameCoordinating
    
    // MARK: Inits
    
    override func loadView() {
        view = viewScreen
    }
    
    init(coordinator: RegisterNameCoordinating) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
        tappedRegisterButton()
        tappedBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func tappedRegisterButton() {
        viewScreen.customView.continueButton.rx.tap.bind {
            guard let name = self.viewScreen.customView.nameTextField.text, !name.isEmpty else {
                self.showBasicAlert(title: "Erro", message: "Campo nome está vazio.", viewController: self) {}
                return
            }
            self.coordinator.showRegisterEmail(nameUser: name)
        }.disposed(by: disposeBag)
    }
    
    private func tappedBackButton() {
        viewScreen.customView.backButton.rx.tap.bind {
            self.coordinator.backViewController()
        }.disposed(by: disposeBag)
    }
}

extension RegisterNameViewController: AlertProtocol {}
