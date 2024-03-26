//
//  MyDataView.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/03/24.
//

import UIKit

final class MyDataView: UIView {
    
    // MARK: - ElementsVisual
    
    private lazy var headerBackground: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "backgroundHeader")
        return element
    }()
    
    private lazy var mainStackView: SimpleScrollView = {
        let element = SimpleScrollView(spacing: 10, margins: NSDirectionalEdgeInsets(top: 70,
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
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyDataView: ViewCodeUIView {
    
    // MARK: - Add Elements e Constraints
    
    func addElementsView() {
        mainStackView.addSubview(myDataView)
        self.addSubview(headerBackground)
        self.addSubview(mainStackView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: self.topAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 200),
            
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor),
        ])
        
        let heightAnchor = mainStackView.heightAnchor.constraint(equalTo: heightAnchor)
        heightAnchor.priority = .defaultLow
        heightAnchor.isActive = true
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .cinzaClaro
    }
}

