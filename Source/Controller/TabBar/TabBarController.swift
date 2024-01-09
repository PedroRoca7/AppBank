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
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white
        configureTabBarItems()
    }
    
    private func configureTabBarItems() {
        guard let viewControllers = viewControllers else { return }
        
        for (index, viewController) in viewControllers.enumerated() {
            var imageName: String
            var imageSize: CGSize
            
            switch index {
            case 0:
                imageName = "iconHome"
                imageSize = CGSize(width: 30, height: 30)
            case 1:
                imageName = "iconExtract"
                imageSize = CGSize(width: 30, height: 30)
            case 2:
                imageName = "iconBox"
                imageSize = CGSize(width: 30, height: 30)
            default:
                imageName = "iconHome"
                imageSize = CGSize(width: 30, height: 30)
            }
            
            if let originalImage = UIImage(named: imageName) {
                let resizedImage = originalImage.resized(to: imageSize)
                viewController.tabBarItem = UITabBarItem(title: "", image: resizedImage, selectedImage: nil)
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
