//
//  ButtonDefault.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class ButtonDefault: UIButton {
    
    // MARK: Inits
    
    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        initDefault(title: title,backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(title: String, backgroundColor: UIColor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = backgroundColor
    }
}
