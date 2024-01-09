//
//  CustomProductsTableViewCell.swift
//  AppBank
//
//  Created by Pedro Henrique on 10/10/23.
//

import UIKit

class CustomProductsTableViewCell: UITableViewCell {
    
    static let identifier: String = "CustomProductsTableViewCell"
    
    lazy var viewCell: ProductsViewCell = {
        let viewCell = ProductsViewCell()
        viewCell.translatesAutoresizingMaskIntoConstraints = false
        viewCell.backgroundColor = .white
        viewCell.layer.cornerRadius = 10
        viewCell.layer.borderColor = UIColor.black.cgColor
        viewCell.layer.borderWidth = 1
        viewCell.clipsToBounds = true
        return viewCell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViewScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewScreen() {
        contentView.addSubview(viewCell)
        
        NSLayoutConstraint.activate([
            viewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    public func prepareCell(optionLabel: OptionsInvestiments) {
        DispatchQueue.main.async {
            self.viewCell.iconImageView.image = UIImage(named: optionLabel.icon)
            self.viewCell.nameOptionLabel.text = optionLabel.optionInvestiment
        }
    }
}

