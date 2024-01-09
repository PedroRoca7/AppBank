//
//  FormatterNumber.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import Foundation

class FormatterNumber {
    static func formatNumberToCurrency(value: Double, typeCurrency: String, currencySymbol: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2

        var formattedString = numberFormatter.string(from: NSNumber(value: abs(value))) ?? "Valor indefinido"
        
        if value < 0 {
            formattedString = "\(currencySymbol) " + formattedString
        } else {
            formattedString = "\(currencySymbol) " + formattedString
        }
        return formattedString
    }
}
