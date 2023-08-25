//
//  CellView.swift
//  Itubers
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

class CellView: UIView {
    
    // MARK: Property
    private lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    

    
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


