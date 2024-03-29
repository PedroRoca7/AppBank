//
//  LoginViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import Foundation

protocol LoginProtocol: AnyObject {
    func success(user: User)
    func failure()
}

protocol LoginViewModeling: AnyObject {
    var delegate: LoginProtocol? { get set }
    func login(email: String, password: String)
    func showRegisterScreen()
    func showHomeScreen(user: User)
}

class LoginViewModel: LoginViewModeling {
    
    // MARK: Propertys
    
    private var coordinator: LoginCoordinating
    weak var delegate: LoginProtocol?
    
    //MARK: Init
    
    init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }
    
    // MARK: Methods
        
    public func login(email: String, password: String) {
        AuthenticatorFirebase.auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.delegate?.failure()
                print("Erro ao fazer login: \(error.localizedDescription)")
            } else {
                guard let result = result else { self.delegate?.failure()
                    return }
                let userID = result.user.uid
                self.successLogin(id: userID)
            }
        }
    }
    
    public func showHomeScreen(user: User) {
        coordinator.showHomeController(user: user)
    }
    
    public func showRegisterScreen() {
        coordinator.startRegisterScreen()
    }
    
    private func successLogin(id: String) {
        let db = AuthenticatorFirebase.firestore
        db.collection("Usuários").document(id).getDocument { document, error in
            if let error = error {
                print("Dados do usuário não encontrado ou ocorreu um erro: \(error.localizedDescription)")
                self.delegate?.failure()
            } else if let document = document, document.exists {
                if let userData = document.data() {
                    guard let nome = userData["nome"] as? String,
                          let email = userData["email"] as? String else { return }
                    let user = User(name: nome, email: email, password: "")
                    self.delegate?.success(user: user)
                }
            }
        }
    }
}

