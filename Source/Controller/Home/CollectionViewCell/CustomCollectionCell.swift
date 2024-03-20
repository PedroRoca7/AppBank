//
//  CustomCollectionCell.swift
//  AppBank
//
//  Created by Pedro Henrique on 06/10/23.
//
import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    static var identifier: String = "CustomCollectionCell"
    
    lazy var cellView: CollectionCellView = {
        let view = CollectionCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.layer.masksToBounds = true
        view.alpha = 0.6
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                UIView.animate(withDuration: 0.2) {
                    self.cellView.alpha = 1.0
                    self.backgroundColor = .cinzaClaro.withAlphaComponent(0.2)
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.cellView.alpha = 0.6
                    self.backgroundColor = .clear
                }
            }
        }
    }
    
    public func prepareCollectionCell(title: String, nameImage: String) {
        cellView.buttonTitleLabel.text = title
        cellView.imageButton.image = UIImage(named: nameImage)
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
