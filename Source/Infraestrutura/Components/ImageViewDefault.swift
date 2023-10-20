//
//  ImageViewDefault.swift
//  AppBank
//
//  Created by Pedro Henrique on 04/10/23.
//

import UIKit

class ImageViewDefault: UIImageView {
    
    // MARK: Inits
    
    init() {
        super.init(frame: .zero)
        initImageViewDefault(backgroundColor: .white, nameImage: "")
    }
    
    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        initImageViewDefault(backgroundColor: backgroundColor, nameImage: "")
    }
    
    init(backgroundColor: UIColor, nameImage: String) {
        super.init(frame: .zero)
        initImageViewDefault(backgroundColor: backgroundColor, nameImage: nameImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initImageViewDefault(backgroundColor: UIColor, nameImage: String?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = backgroundColor
        if let image = nameImage {
            self.image = UIImage(named: image)
        }
    }
    
}
