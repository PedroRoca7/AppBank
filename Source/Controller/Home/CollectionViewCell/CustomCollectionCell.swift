//
//  CustomCollectionCell.swift
//  AppBank
//
//  Created by Pedro Henrique on 06/10/23.
//
import UIKit

enum ChooseButton: String {
    case pix = "Pix"
    case transfer = "Fazer Transfêrencia"
    case pay = "Pagar contas"
    case security = "Seguros"
    
}

class CustomCollectionCell: UICollectionViewCell {
    
    static var identifier: String = "CustomCollectionCell"
    
    lazy var cellView: CollectionCellView = {
        let view = CollectionCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func prepareCollectionCell(title: String) {
        if let buttonEnum = ChooseButton(rawValue: title) {
            cellView.button.setTitle(title, for: .normal)
            switch buttonEnum {
            case .pix:
                cellView.button.setImage(UIImage(named: "paperplane.fill"), for: .normal)
            case .transfer:
                cellView.button.setImage(UIImage(named: "tray.and.arrow.up.fill"), for: .normal)
            case .pay:
                cellView.button.setImage(UIImage(named: "arrow.down.doc.fill"), for: .normal)
            case.security:
                cellView.button.setImage(UIImage(named: "lock.fill"), for: .normal)
            }
        }
    }
    
    private func configConstraints() {
        contentView.addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
}
