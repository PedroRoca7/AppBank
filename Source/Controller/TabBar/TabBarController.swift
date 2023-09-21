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
        self.tabBar.tintColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.layer.borderColor = UIColor.blue.cgColor
        self.tabBar.layer.borderWidth = 2
        self.tabBar.backgroundColor = .black
        
    }
}
