//
//  MyDataFactory.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

enum MyDataFactory {
    static func makeModule() -> UIViewController {
        let viewController = MyDataViewController()
        return viewController
    }
}
