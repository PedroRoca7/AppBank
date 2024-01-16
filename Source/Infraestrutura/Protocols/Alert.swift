//
//  Alert.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

protocol AlertProtocol {
    func showBasicAlert(title: String, message: String, viewController: UIViewController, completion: (() -> Void)?)
    func showActionSheet(title: String, message: String, viewController: UIViewController, onCompletion: @escaping (Bool) -> Void)
}

extension AlertProtocol {
    
    func showBasicAlert(title: String, message: String, viewController: UIViewController, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    func showActionSheet(title: String, message: String, viewController: UIViewController, onCompletion: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let tryAgainAction = UIAlertAction(title: "Tente outra vez", style: .default) { _ in
            alertController.dismiss(animated: true)
            onCompletion(true)
        }
        alertController.addAction(tryAgainAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
            onCompletion(false)
        }
        alertController.addAction(cancelAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
