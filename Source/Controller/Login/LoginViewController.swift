//
//  LoginViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    // MARK: Propertys
    private let disposeBag = DisposeBag()
    
    lazy private var viewScreen: LoginView = {
        let view = LoginView()
        return view
    }()
    
    private var viewModel: LoginViewModeling
    
    // MARK: Inits
    
    override func loadView() {
        self.view = viewScreen
    }
    
    init(viewModel: LoginViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
        tappedLoginButton()
        tappedRegisterButton()
    }
}

private extension LoginViewController {
    func tappedRegisterButton() {
        viewScreen.registerButton.rx.tap.bind {
            self.viewModel.showRegisterScreen()
        }.disposed(by: disposeBag)
    }
    
    func tappedLoginButton() {
        viewScreen.customView.entryButton.rx.tap.bind {
            guard let email = self.viewScreen.customView.userTextField.text, !email.isEmpty,
                  let password = self.viewScreen.customView.passwordTextField.text, !password.isEmpty else {
                self.showBasicAlert(title: "Erro", message: "Campos vazios", viewController: self) {}
                return }
            self.viewModel.login(email: email, password: password)
        }.disposed(by: disposeBag)
    }
}

extension LoginViewController: LoginProtocol, AlertProtocol {
    func success(user: User) {
        viewModel.showHomeScreen(user: user)
    }
    
    func failure() {
        showBasicAlert(title: "Erro", message: "Erro ao tentar fazer login", viewController: self) {}
    }
}
