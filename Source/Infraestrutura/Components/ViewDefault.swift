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
        initDefault(backgroundColor: .clear, alpha: 1)
    }
    
    init(backgroundColor: UIColor, alpha: Double) {
        super.init(frame: .zero)
        initDefault(backgroundColor: backgroundColor, alpha: alpha)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(backgroundColor: UIColor, alpha: Double) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.alpha = alpha
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
}
