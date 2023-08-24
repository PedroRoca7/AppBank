//
//  LoginViewController.swift
//  Itubers
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
            guard let email = self.viewScreen.emailTextFiled.text,
                  let password = self.viewScreen.passwordTextField.text else { return }
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
        // Mostrar alerta de erro.
    }
    
    
}
