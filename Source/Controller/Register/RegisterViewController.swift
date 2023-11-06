//
//  RegisterViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {
    
    // MARK: Propertys
    private let disposeBag = DisposeBag()
    var showLoginScreen: (() -> Void)?
    
    lazy var viewScreen: RegisterView = {
        let view = RegisterView()
        return view
    }()
    
    lazy var viewModel: RegisterViewModel = {
        let vm = RegisterViewModel()
        return vm
    }()
    
    // MARK: Inits
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
        setupDelegates()
        tappedRegisterButton()

    }
    
    private func tappedRegisterButton() {
        viewScreen.registerButton.rx.tap.bind {
            guard let name = self.viewScreen.nameTextField.text, !name.isEmpty,
                  let email = self.viewScreen.emailTextField.text, !email.isEmpty,
                  let password = self.viewScreen.passwordTextField.text, !password.isEmpty else {
                Alert.showBasicAlert(title: "Erro", message: "Campos Inválidos ou Vazios", viewController: self) {}
            return
            }
            
            if password.count < 6 {
                Alert.showBasicAlert(title: "Erro", message: "A senha tem que conter no mínimo 6 caracteres.", viewController: self) {}
            }
            let user = User(name: name, email: email, password: password)
            self.viewModel.registerUser(user: user)
        }.disposed(by: disposeBag)
    }
    
    private func setupDelegates() {
        viewModel.delegate = self
    }
}

extension RegisterViewController: RegisterProtocol {
    func successRegister() {
        Alert.showBasicAlert(title: "Sucesso", message: "Usuário cadastrado com sucesso.", viewController: self) {
            self.showLoginScreen?()
        }
    }
    
    func failureRegister() {
        Alert.showActionSheet(title: "Erro", message: "Erro ao registar usuário", viewController: self) { result in
            if !result {
                self.showLoginScreen?()
            }
        }
    }
}
