//
//  RegisterEmailViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 15/03/24.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterEmailViewController: UIViewController {
    
    // MARK: Propertys
    private let disposeBag = DisposeBag()
    private let nameUser: String
    
    private lazy var viewScreen: RegisterEmailView = {
        let view = RegisterEmailView()
        return view
    }()
    
    private var coordinator: RegisterEmailCoordinating
    
    // MARK: Inits
    
    override func loadView() {
        view = viewScreen
    }
    
    init(nameUser: String, coordinator: RegisterEmailCoordinating) {
        self.nameUser = nameUser
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
    
    private func tappedRegisterButton() {
        viewScreen.customView.continueButton.rx.tap.bind {
            guard let email = self.viewScreen.customView.emailTextField.text, !email.isEmpty else {
                self.showBasicAlert(title: "Erro", message: "Campos de e-mail inválido.", viewController: self) {}
                return
            }
            self.coordinator.showRegisterPassword(nameUser: self.nameUser, emailUser: email)
        }.disposed(by: disposeBag)
    }
    
    private func tappedBackButton() {
        viewScreen.customView.backButton.rx.tap.bind {
            self.coordinator.backViewController()
        }.disposed(by: disposeBag)
    }
}

extension RegisterEmailViewController: AlertProtocol {}

