//
//  MyDataView.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

final class MyDataView: UIView {
    
    // MARK: ElementsVisual
    
    private lazy var mainStackView: SimpleScrollView = {
        let element = SimpleScrollView(spacing: 10, margins: NSDirectionalEdgeInsets(top: 15,
                                                                                     leading: 15,
                                                                                     bottom: 15,
                                                                                     trailing: 15))
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var myDataView: CustomMyDataView = {
        let element = CustomMyDataView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyDataView: ViewCodeUIView {
    
    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        mainStackView.addSubview(myDataView)
        self.addSubview(mainStackView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
        ])
        
        let heightAnchor = mainStackView.heightAnchor.constraint(equalTo: heightAnchor)
        heightAnchor.priority = .defaultLow
        heightAnchor.isActive = true
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .cinzaClaro
    }
}

