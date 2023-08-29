//
//  CustomTableViewCell.swift
//  Itubers
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier: String = "CustomTableViewCell"
    
    lazy var viewCell: CellView = {
        let viewCell = CellView()
        return viewCell
    }()
    
    lazy var viewScreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .blue
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         contentView.addSubview(viewCell)
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func prepareCell(statement: StatementViewModel) {
        if statement.type == .Input {
            viewCell.contentView.backgroundColor = .green
            viewCell.typeEntryLabel.text = "Entrada"
            viewCell.amountLabel.text = statement.amout
            viewCell.aboutLabel.text = statement.about
        } else {
            viewCell.contentView.backgroundColor = .red
            viewCell.typeEntryLabel.text = "Saída"
            viewCell.amountLabel.text = statement.amout
            viewCell.aboutLabel.text = statement.about
        }
    }
}
