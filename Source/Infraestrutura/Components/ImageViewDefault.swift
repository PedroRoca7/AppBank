//
//  ImageViewDefault.swift
//  AppBank
//
//  Created by Pedro Henrique on 04/10/23.
//

import UIKit

class ImageViewDefault: UIImageView {
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initImageViewDefault(backgroundColor: .white)
    }
    
    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        initImageViewDefault(backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initImageViewDefault(backgroundColor: UIColor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = backgroundColor
        
    }
    
}
