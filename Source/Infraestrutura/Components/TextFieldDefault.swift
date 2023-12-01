//
//  TextFieldDefault.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class TextFieldDefault: UITextField {
    
    // MARK: Constants
    
    private let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    
    // MARK: Inits
    
    init(placeholder: String, keyboardType: UIKeyboardType, backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        initDefault(placeholder: placeholder, keyboardType: keyboardType, backgroundColor: backgroundColor)
    }
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        initDefault(placeholder: placeholder, keyboardType: .default,backgroundColor: .white)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(placeholder: String, keyboardType: UIKeyboardType, backgroundColor: UIColor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = backgroundColor
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.keyboardType = keyboardType

        // Adicionar a linha de baixo usando uma sublayer
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(5.0, 40 - 1, 300, 2.5)
        bottomLine.backgroundColor = UIColor.white.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
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
