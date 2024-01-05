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
        initDefault(backgroundColor: .clear)
    }
    
    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        initDefault(backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(backgroundColor: UIColor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10
    }
}
