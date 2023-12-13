//
//  TabBarController.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class TabBarController: UITabBarController {
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        self.tabBar.tintColor = .blue
        self.tabBar.isTranslucent = false
        self.tabBar.layer.borderColor = UIColor.white.cgColor
        self.tabBar.layer.borderWidth = 2
        self.tabBar.backgroundColor = .white
        
        configureTabBarItems()
    }
    
    private func configureTabBarItems() {
        guard let viewControllers = viewControllers else { return }
        
        for (index, viewController) in viewControllers.enumerated() {
            var imageName: String
            var imageSize: CGSize
            var title: String
            
            switch index {
            case 0:
                imageName = "iconHome"
                imageSize = CGSize(width: 30, height: 30)
                title = "Home"
            case 1:
                imageName = "iconExtract"
                imageSize = CGSize(width: 30, height: 30)
                title = "Extrato"
            case 2:
                imageName = "iconSuitcase"
                imageSize = CGSize(width: 30, height: 30)
                title = "Produtos"
            default:
                imageName = "iconHome"
                imageSize = CGSize(width: 30, height: 30)
                title = "Erro"
            }
            
            if let originalImage = UIImage(named: imageName) {
                let resizedImage = originalImage.resized(to: imageSize)
                viewController.tabBarItem = UITabBarItem(title: title, image: resizedImage, selectedImage: nil)
            }
            
        }
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
