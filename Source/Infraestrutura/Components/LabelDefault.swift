//
//  LabelDefault.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class LabelDefault: UILabel {
    
    // MARK: Inits
    
    init(text: String, color: UIColor, font: UIFont) {
         super.init(frame: .zero)
         
         initDefault(text: text, color: color, font: font)
    }
    
    init(text: String) {
         super.init(frame: .zero)
         
        initDefault(text: text, color: UIColor.black, font: .systemFont(ofSize: 17))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(text: String, color: UIColor, font: UIFont) {
        self.text = text
        self.textColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
    }
    
}
