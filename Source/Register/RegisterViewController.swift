//
//  RegisterViewController.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: ViewControllerDefault {
    
    // MARK: Propertys
    private let disposeBag = DisposeBag()
    var loginScreen: (() -> Void)?
    
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
        viewModel.delegate = self
        
        viewScreen.registerButton.rx.tap.bind {
            guard let name = self.viewScreen.nameTextField.text, !name.isEmpty,
                  let email = self.viewScreen.emailTextField.text, !email.isEmpty,
                  let password = self.viewScreen.passwordTextField.text, !password.isEmpty else {
                
                Alert.showBasicAlert(title: "Erro", message: "Campos Inválidos ou Vazios", viewController: self)
                return
            }
            
            if password.count < 6 {
                Alert.showBasicAlert(title: "Erro", message: "A senha tem que conter no mínimo 6 caracteres.", viewController: self)
                return
            }
            
            var user = User(name: name, email: email, password: password)
            
            self.viewModel.registerUser(user: user)
        }.disposed(by: disposeBag)
        
        
    }
}

extension RegisterViewController: RegisterProtocol {
    func success() {
        loginScreen?()
    }
    
    func failure(error: Error) {
        print("Erro ao cadastrar: \(error.localizedDescription)")
        Alert.showActionSheet(title: "Erro", message: "Erro ao registar", viewController: self) { result in
            if !result {
                self.loginScreen?()
            }
        }
    }
    
    
}
