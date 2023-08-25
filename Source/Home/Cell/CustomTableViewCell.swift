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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.contentView.addSubview(viewCell)
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func prepareCell(typeEntry: TypeEntry, about: String, amount: String) {
        if typeEntry == .Input {
            viewCell.backgroundColor = .red
            viewCell.typeEntryLabel.text = "Saída"
            viewCell.amountLabel.text = amount
            viewCell.aboutLabel.text = about
        } else {
            viewCell.backgroundColor = .green
            viewCell.typeEntryLabel.text = "Entrada"
            viewCell.amountLabel.text = amount
            viewCell.aboutLabel.text = about
        }
    }
}
