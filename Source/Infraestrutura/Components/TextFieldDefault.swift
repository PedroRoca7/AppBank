//
//  TextFieldDefault.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class TextFieldDefault: UITextField {
    
    init(placeholder: String, keyboardType: UIKeyboardType) {
        super.init(frame: .zero)
        
        initDefault(placeholder: placeholder, keyboardType: keyboardType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(placeholder: String, keyboardType: UIKeyboardType) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        self.keyboardType = keyboardType
    }
    
}
