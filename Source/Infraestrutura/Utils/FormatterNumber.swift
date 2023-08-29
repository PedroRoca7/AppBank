//
//  FormatterNumber.swift
//  Itubers
//
//  Created by Pedro Henrique on 29/08/23.
//

import Foundation

class FormatterNumber {
    static func formatNumberToCurrency(value: Double, typeCurrency: String, currencySimbol: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = currencySimbol
        numberFormatter.locale = Locale(identifier: typeCurrency)
        numberFormatter.minimumFractionDigits = 2

        return numberFormatter.string(from: NSNumber(value:value)) ?? "Valor indefinido"
    }
}
