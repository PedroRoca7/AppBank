//
//  LoginViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import Foundation

protocol LoginProtocol: AnyObject {
    func success(user: User)
    func failure(error: Error)
}

class LoginViewModel {
    
    // MARK: Propertys
    
    weak var delegate: LoginProtocol?
    
    // MARK: Functions
    
    public func login(email: String, password: String) {
        AuthenticatorFirebase.auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.delegate?.failure(error: error)
            } else if let result = result {
                let userID = result.user.uid
                
                let db = AuthenticatorFirebase.firestore
                
                db.collection("Usuários").document(userID).getDocument { document, error in
                    if let error = error {
                        print("Dados do usuário não encontrado ou ocorreu um erro: \(error.localizedDescription)")
                        self.delegate?.failure(error: error)
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
    }
}
