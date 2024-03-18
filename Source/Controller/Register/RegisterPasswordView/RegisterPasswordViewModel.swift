//
//  RegisterViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import Foundation

protocol RegisterProtocol: AnyObject {
    func successRegister()
    func failureRegister()
}

protocol RegisterPasswordViewModeling: AnyObject {
    var delegate: RegisterProtocol? { get set }
    func registerUser(user: User)
    func backViewController()
    func showRequestScreen()
}

class RegisterPasswordViewModel: RegisterPasswordViewModeling {
    
    // MARK: Propertys
    
    weak var delegate: RegisterProtocol?
    private var coordinator: RegisterPasswordCoordinating
    
    //MARK: Inits
    
    init(coordinator: RegisterPasswordCoordinating) {
        self.coordinator = coordinator
    }
    
    public func backViewController() {
        coordinator.backViewController()
    }
    
    public func showRequestScreen() {
        coordinator.showRequestScreen()
    }
    
    public func registerUser(user: User) {
        
        AuthenticatorFirebase.auth.createUser(withEmail: user.email, password: user.password) { (result, error) in
            if let error = error {
                self.delegate?.failureRegister()
                print("Erro ao fazer registro: \(error.localizedDescription)")
            } else {
                guard let result = result else { self.delegate?.failureRegister()
                    return}
                let id = result.user.uid
                self.writeUserDatabase(user: user, id: id)
            }
        }
    }
    
    private func writeUserDatabase(user: User, id: String) {
        let userData: [String: Any] = [
            "nome": user.name,
            "email": user.email
        ]
        
        let db = AuthenticatorFirebase.firestore
        
        db.collection("Usuários").document(id).setData(userData) { error in
            if let error = error {
                self.delegate?.failureRegister()
                print("Tabela Usuários não encontrada no banco de dados: \(error.localizedDescription)")
            } else {
                self.delegate?.successRegister()
            }
        }
    }
}
