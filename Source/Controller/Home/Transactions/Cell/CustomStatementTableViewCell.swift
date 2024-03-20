//
//  CustomStatementTableViewCell.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

class CustomStatementTableViewCell: UITableViewCell {
    
    static let identifier: String = "CustomStatementTableViewCell"
    
    lazy var viewCell: StatementCellView = {
        let viewCell = StatementCellView()
        viewCell.translatesAutoresizingMaskIntoConstraints = false
        viewCell.clipsToBounds = true
        return viewCell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        contentView.backgroundColor = .white
        backgroundColor = .white
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareCell(extract: ServiceViewModel) {
        if extract.type == .Input {
            viewCell.amountLabel.text = FormatterNumber.formatNumberToCurrency(value: extract.amout, typeCurrency: "pt-BR", currencySymbol: "+R$")
            viewCell.amountLabel.textColor = .green
            viewCell.aboutLabel.text = extract.about
        } else {
            viewCell.amountLabel.text = FormatterNumber.formatNumberToCurrency(value: extract.amout, typeCurrency: "pt-BR", currencySymbol: "-R$")
            viewCell.amountLabel.textColor = .black
            viewCell.aboutLabel.text = extract.about
        }
    }
}

extension CustomStatementTableViewCell: ViewCodeUIView {
    func addElementsView() {
        contentView.addSubview(viewCell)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            viewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
