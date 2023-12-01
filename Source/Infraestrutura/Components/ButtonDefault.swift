//
//  ButtonDefault.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class ButtonDefault: UIButton {
    
    // MARK: Inits
    
    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        initDefault(title: title,backgroundColor: backgroundColor, nameImage: nil)
    }
    
    init() {
        super.init(frame: .zero)
        initDefault(title: "", backgroundColor: .clear, nameImage: nil)
    }
    
    init(title: String, backgroundColor: UIColor, nameImage: String) {
        super.init(frame: .zero)
        initDefault(title: title, backgroundColor: backgroundColor, nameImage: nameImage)
    }
    
    init(nameImage: String) {
        super.init(frame: .zero)
        initDefault(title: "", backgroundColor: .clear, nameImage: nameImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func initDefault(title: String, backgroundColor: UIColor, nameImage: String?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = backgroundColor
        if let image = nameImage {
            self.setImage(UIImage(named: image), for: .normal)
        }
        
    }
}
