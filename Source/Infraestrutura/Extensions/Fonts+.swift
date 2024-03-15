//
//  Fonts+.swift
//  AppBank
//
//  Created by Pedro Henrique on 14/03/24.
//

import UIKit

extension UIFont {
    
    enum ComfortaaFontType {
        case light
        case regular
        case medium
        case semiBold
        case bold
        
        func getFontName() -> String {
            switch self {
            case .light:
                return "Comfortaa-Light"
            case .regular:
                return "Comfortaa-Regular"
            case .medium:
                return "Comfortaa-Medium"
            case .semiBold:
                return "Comfortaa-SemiBold"
            case .bold:
                return "Comfortaa-Bold"
            }
        }
        
        func getWeight() -> UIFont.Weight {
            switch self {
            case .light:
                return .light
            case .regular:
                return .regular
            case .medium:
                return .medium
            case .semiBold:
                return .semibold
            case .bold:
                return .bold
            }
        }
    }
    
    static func customComfortaaFont(type: ComfortaaFontType, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.getFontName(), size: size) else {
            return UIFont.systemFont(ofSize: size, weight: type.getWeight())
        }
        return font
    }
    
    enum SegoeUIFontType {
        case boldItalic
        case regular
        case italic
        case bold
        
        func getFontName() -> String {
            switch self {
            case .boldItalic:
                return "SegoeUI-Bold-Italic"
            case .regular:
                return "SegoeUI"
            case .italic:
                return "SegoeUI-Italic"
            case .bold:
                return "SegoeUI-Bold"
            }
        }
        
        func getWeight() -> UIFont.Weight {
            switch self {
            case .boldItalic:
                return .light
            case .regular:
                return .regular
            case .italic:
                return .medium
            case .bold:
                return .bold
            }
        }
    }
    
    static func customSegoeUIFont(type: SegoeUIFontType, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.getFontName(), size: size) else {
            return UIFont.systemFont(ofSize: size, weight: type.getWeight())
        }
        return font
    }
}
