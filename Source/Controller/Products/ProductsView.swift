//
//  ProductsView.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class ProductsView: UIView {
    
    // MARK: Property
    
    
    // MARK: ElementsVisual
    
    lazy var backgroundImage = ImageViewDefault(backgroundColor: .orange)
    lazy var subViewCardView = ViewDefault(backgroundColor: .darkGray, alpha: 0.5)
    lazy var viewCardButton = ButtonDefault(nameImage: "creditcard.fill")
    lazy var cardLabel = LabelDefault(text: "Crédito", color: .white, font: .boldSystemFont(ofSize: 16))
    
    
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Add Elements e Constraints
    
    private func addElementsView() {
        
    }
}

