//
//  TextFieldDefault.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class TextFieldDefault: UITextField {
    
    // MARK: Constants
    
    private let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    
    // MARK: Inits
    
    init(placeholder: String, keyboardType: UIKeyboardType) {
        super.init(frame: .zero)
        
        initDefault(placeholder: placeholder, keyboardType: keyboardType)
    }
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        initDefault(placeholder: placeholder, keyboardType: .default)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(placeholder: String, keyboardType: UIKeyboardType) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.backgroundColor = .white
        self.placeholder = placeholder
        self.keyboardType = keyboardType
    }
    
    // MARK: Add padding in textField
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
        
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
