//
//  RegisterPasswordViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 15/03/24.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterPasswordViewController: UIViewController {
    
    // MARK: Propertys
    private let disposeBag = DisposeBag()
    private let nameUser: String
    private let emailUser: String
    
    private lazy var viewScreen: RegisterPasswordView = {
        let view = RegisterPasswordView()
        return view
    }()

    private var viewModel: RegisterPasswordViewModeling
    
    // MARK: Inits
    
    override func loadView() {
        view = viewScreen
    }
    
    init(nameUser: String, emailUser: String, viewModel: RegisterPasswordViewModeling ) {
        self.nameUser = nameUser
        self.viewModel = viewModel
        self.emailUser = emailUser
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
        observeNumberCharactersTextField()
    }
    
    private func observeNumberCharactersTextField() {
        viewScreen.customView.passwordTextField.rx.text.orEmpty
            .map{ $0.count == 6 }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] hasSixCharacters in
                self?.viewScreen.customView.verifedPasswordLabel.textColor = hasSixCharacters ? .green : .red
            })
            .disposed(by: disposeBag)
    }
    
    private func tappedRegisterButton() {
        viewScreen.customView.continueButton.rx.tap.bind {
            guard let password = self.viewScreen.customView.passwordTextField.text, !password.isEmpty else {
                self.showBasicAlert(title: "Erro", message: "Campo de senha inválido.", viewController: self) {}
                return
            }
            self.viewModel.registerUser(user: User(name: self.nameUser, email: self.emailUser, password: password))
        }.disposed(by: disposeBag)
    }
    
    private func tappedBackButton() {
        viewScreen.customView.backButton.rx.tap.bind {
            self.viewModel.backViewController()
        }.disposed(by: disposeBag)
    }
}

extension RegisterPasswordViewController: AlertProtocol {}

extension RegisterPasswordViewController: RegisterProtocol {
    func successRegister() {
        viewModel.showRequestScreen()
    }
    
    func failureRegister() {
        showBasicAlert(title: "Erro", message: "Erro ao fazer cadastro", viewController: self) {}
    }
}
