//
//  LabelDefault.swift
//  Itubers
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class LabelDefault: UILabel {
    
     init(text: String) {
         super.init(frame: .zero)
         
         initDefault(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(text: String) {
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
