//
//  CustomCollectionCell.swift
//  AppBank
//
//  Created by Pedro Henrique on 06/10/23.
//
import UIKit

enum ChooseButton: String {
    case pix = "Pix"
    case transfer = "Transfer"
    case pay = "Pay account"
    case security = "Security"
    case cardCredit = "Credit Card"
    case collect = "Collect"
}

class CustomCollectionCell: UICollectionViewCell {
    
    static var identifier: String = "CustomCollectionCell"
    
    lazy var cellView: CollectionCellView = {
        let view = CollectionCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func prepareCollectionCell(title: String, button: ChooseButton) {
        switch button {
        case .pix:
            cellView.pixLabel.text = title
            cellView.button.setImage(UIImage(named: "iconSend"), for: .normal)
        case .pay:
            cellView.pixLabel.text = title
            cellView.button.setImage(UIImage(named: "iconPayments"), for: .normal)
        case .cardCredit:
            cellView.pixLabel.text = title
            cellView.button.setImage(UIImage(named: "iconCreditCard"), for: .normal)
        case .collect:
            cellView.pixLabel.text = title
            cellView.button.setImage(UIImage(named: "iconMoney"), for: .normal)
        case.security:
            cellView.pixLabel.text = title
            cellView.button.setImage(UIImage(named: "iconSecurity"), for: .normal)
        case.transfer:
            cellView.pixLabel.text = title
            cellView.button.setImage(UIImage(named: "iconTransfer"), for: .normal)
        }
    }
    
    
}

extension CustomCollectionCell: ViewCodeUIView {
    func addElementsView() {
        contentView.addSubview(cellView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
