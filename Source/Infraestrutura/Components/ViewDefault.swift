//
//  ViewDefault.swift
//  AppBank
//
//  Created by Pedro Henrique on 03/10/23.
//

import UIKit

class ViewDefault: UIView {
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .darkGray
        self.alpha = 1
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
}
