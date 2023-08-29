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
        viewCell.translatesAutoresizingMaskIntoConstraints = false
        viewCell.layer.cornerRadius = 15
        viewCell.backgroundColor = .clear
        viewCell.layer.borderColor = UIColor.black.cgColor
        viewCell.layer.borderWidth = 1
        return viewCell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViewScreen()
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func prepareCell(statement: StatementViewModel) {
        if statement.type == .Input {
            viewCell.contentView.backgroundColor = .green
            viewCell.typeEntryLabel.text = "Entrada"
            viewCell.amountLabel.text = "R$: \(formatNumberToDecimal(value: statement.amout))"
            viewCell.aboutLabel.text = statement.about
        } else {
            viewCell.contentView.backgroundColor = .red
            viewCell.typeEntryLabel.text = "Saída"
            viewCell.amountLabel.text = "R$: \(formatNumberToDecimal(value: statement.amout))"
            viewCell.aboutLabel.text = statement.about
        }
    }
    
    private func setViewScreen() {
        contentView.addSubview(viewCell)
        
        NSLayoutConstraint.activate([
            viewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            viewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            viewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
        ])
    }
    
    private func formatNumberToDecimal(value: Int) -> String {
        let numberFormatter = NumberFormatter()

        // Atribuindo o locale desejado
        numberFormatter.locale = Locale(identifier: "pt_BR")

        // Importante para que sejam exibidas as duas casas após a vírgula
        numberFormatter.minimumFractionDigits = 2

        numberFormatter.numberStyle = .decimal

        return numberFormatter.string(from: NSNumber(value:value)) ?? "Valor indefinido"
    }
}
