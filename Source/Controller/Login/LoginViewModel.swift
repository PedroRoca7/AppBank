//
//  LoginViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import Foundation

protocol LoginProtocol: NSObject {
    func successLogin(user: User)
    func failureLogin()
}

class LoginViewModel {
    
    // MARK: Propertys
    
    weak var delegate: LoginProtocol?
    
    // MARK: Functions
    
    public func login(email: String, password: String) {
        AuthenticatorFirebase.auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.delegate?.failureLogin()
                print("Erro ao fazer login: \(error.localizedDescription)")
            } else {
                guard let result = result else { self.delegate?.failureLogin()
                    return }
                let userID = result.user.uid
                self.successLogin(id: userID)
            }
        }
    }
    
    private func successLogin(id: String) {
        let db = AuthenticatorFirebase.firestore
        db.collection("Usuários").document(id).getDocument { document, error in
            if let error = error {
                print("Dados do usuário não encontrado ou ocorreu um erro: \(error.localizedDescription)")
                self.delegate?.failureLogin()
            } else if let document = document, document.exists {
                if let userData = document.data() {
                    guard let nome = userData["nome"] as? String,
                          let email = userData["email"] as? String else { return }
                    let user = User(name: nome, email: email, password: "")
                    self.delegate?.successLogin(user: user)
                }
            }
        }
    }
}

