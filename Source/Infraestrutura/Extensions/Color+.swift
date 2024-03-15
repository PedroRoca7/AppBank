//
//  Color+.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/10/23.
//

import UIKit

extension UIColor {
    static var azulClaro: UIColor {
        return UIColor(named: "AzulClaro") ?? .blue
    }
    
    static var cinzaClaro: UIColor {
        return UIColor(named: "CinzaClaro") ?? .lightGray
    }
    
    static var cinzaEscuro: UIColor {
        return UIColor(named: "CinzaEscuro") ?? .gray
    }
    
    static var verdeAgua: UIColor {
        return UIColor(named: "VerdeAgua") ?? .green
    }
}
