//
//  ActivityDefault.swift
//  AppBank
//
//  Created by Pedro Henrique on 04/10/23.
//

import UIKit

class ActivityDefault: UIActivityIndicatorView {
    
    init() {
        super.init(frame: .zero)
        initActivityDefault(color: .white, style: .medium)
    }
    
    init(color: UIColor, style: UIActivityIndicatorView.Style) {
        super.init(frame: .zero)
        initActivityDefault(color: color, style: style)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initActivityDefault(color: UIColor, style: UIActivityIndicatorView.Style) {
        self.style = style
        self.translatesAutoresizingMaskIntoConstraints = false
        self.color = color
        self.hidesWhenStopped = true
    }
}
