//
//  ProductsView.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class ProductsView: UIView {
    
    // MARK: Property
    
    private lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var backgroundImage = ImageViewDefault(nameImage: "backgroundImage")
    lazy var tableView: UITableView = {
        let tb = UITableView(frame: self.bounds, style: .plain)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(CustomProductsTableViewCell.self, forCellReuseIdentifier: CustomProductsTableViewCell.identifier)
        tb.backgroundColor = .clear
        return tb
    }()
    
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
        setBackgroundImage()
        setTableView()
    }
    
    private func setBackgroundImage() {
        self.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func setTableView() {
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

