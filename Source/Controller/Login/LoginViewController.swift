//
//  LoginViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: ViewControllerDefault {
    
    // MARK: Propertys
    var onLoginTap: ((_ user: User) -> Void)?
    var onRegisterTap: (() -> Void)?
    private let disposeBag = DisposeBag()
    
    lazy var viewScreen: LoginView = {
        let view = LoginView()
        
        return view
    }()
    
    lazy var viewModel: LoginViewModel = {
        let vm = LoginViewModel()
        return vm
    }()
    
    // MARK: Inits
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        viewScreen.logarButton.rx.tap.bind {
            guard let email = self.viewScreen.emailTextFiled.text, !email.isEmpty,
                  let password = self.viewScreen.passwordTextField.text, !password.isEmpty else {
                Alert.showBasicAlert(title: "Erro", message: "Campos vazios", viewController: self) {}
                      return }
            self.viewModel.login(email: email, password: password)
        }.disposed(by: disposeBag)
        
        viewScreen.registerButton.rx.tap.bind {
            self.onRegisterTap?()
        }.disposed(by: disposeBag)
    }
}

extension LoginViewController: LoginProtocol {
    func success(user: User) {
        onLoginTap?(user)
    }
    
    func failure(error: Error) {
        Alert.showBasicAlert(title: "Erro", message: "Erro ao tentar fazer login: \(error.localizedDescription)", viewController: self) {}
    }
}
