//
//  Color+.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/10/23.
//

import UIKit

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    static var backgroundColor: UIColor {
        return UIColor(hex: 0x191970)
    }
    static var lilas: UIColor {
        return UIColor(hex: 0x9932CD)
    }
}
