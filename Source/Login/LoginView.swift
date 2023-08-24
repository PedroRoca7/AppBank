//
//  LoginView.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class LoginView: UIView {
    
    // MARK: Property
    
    
    // MARK: ElementsVisual
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var titleLabel: LabelDefault = {
        let lb = LabelDefault(text: "Login")
        
        return lb
    }()
    
    lazy var emailTextFiled: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Digite seu Email:", keyboardType: .emailAddress)
        
        return tf
    }()
    
    lazy var senhaTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Digite sua Senha:", keyboardType: .numberPad)
        
        return tf
    }()
    
    lazy var logarButton: ButtonDefault = {
        let bt = ButtonDefault(title: "Entrar",backgroundColor: .blue)
        
        return bt
    }()
    
    lazy var registratButton: ButtonDefault = {
        let bt = ButtonDefault(title: "Registrar",backgroundColor: .lightGray)
        
        return bt
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Add Elements e Constraints
    
    private func addElementsView() {
        
    }
}
