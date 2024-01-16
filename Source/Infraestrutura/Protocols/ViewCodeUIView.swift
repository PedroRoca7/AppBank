//
//  ViewCodeUIView.swift
//  AppBank
//
//  Created by Pedro Henrique on 15/01/24.
//

import Foundation

protocol ViewCodeUIView {
    func addElementsView()
    func setupConstraints()
}

extension ViewCodeUIView {
    func setupView() {
        addElementsView()
        setupConstraints()
    }
}

    
