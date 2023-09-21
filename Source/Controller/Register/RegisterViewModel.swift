//
//  RegisterViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import Foundation

protocol RegisterProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

class RegisterViewModel {
    
    // MARK: Propertys
    
    weak var delegate: RegisterProtocol?
    
    public func registerUser(user: User) {
        
        AuthenticatorFirebase.auth.createUser(withEmail: user.email, password: user.password) { (result, error) in
            
            if let error = error {
                self.delegate?.failure(error: error)
            } else if let result = result?.user {
                let userID = result.uid
                
                let userData: [String: Any] = [
                    "nome": user.name,
                    "email": user.email
                ]
                
                let db = AuthenticatorFirebase.firestore
                
                db.collection("Usuários").document(userID).setData(userData) { error in
                    if let error = error {
                        self.delegate?.failure(error: error)
                    } else {
                        self.delegate?.success()
                    }
                }
            }
        }
    }
}
