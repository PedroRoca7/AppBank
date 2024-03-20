//
//  HomeView.swift
//  AppBank
//
//  Created by Pedro Henrique on 25/08/23.
//

import UIKit

class HomeView: UIView {
    
    // MARK: ElementsVisual
    
    private lazy var backgroundHeaderView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "easyBankbackground2"))
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private lazy var logoHeaderView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "EasyBankLogo"))
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .scaleAspectFit
        return element
    }()
    
    lazy var nameClientLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Deboraah"
        element.textColor = .white
        element.font = .customComfortaaFont(type: .bold, size: 25)
        return element
    }()
    
    lazy var agencyAndAccountClientLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Ag 2604-1 / CC 1593867"
        element.textColor = .white
        element.font = .customComfortaaFont(type: .regular, size: 14)
        return element
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 90, height: 80)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 5, bottom: .zero, right: 5)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
   
    lazy var viewCustom: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .cinzaClaro
        return element
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCodeUIView {

    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        self.addSubview(backgroundHeaderView)
        self.addSubview(logoHeaderView)
        self.addSubview(nameClientLabel)
        self.addSubview(agencyAndAccountClientLabel)
        self.addSubview(collectionView)
        self.addSubview(viewCustom)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundHeaderView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundHeaderView.heightAnchor.constraint(equalToConstant: 300),
            
            logoHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            logoHeaderView.widthAnchor.constraint(equalToConstant: 100),
            logoHeaderView.heightAnchor.constraint(equalToConstant: 100),
        
            nameClientLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            agencyAndAccountClientLabel.topAnchor.constraint(equalTo: nameClientLabel.bottomAnchor, constant: 5),
            agencyAndAccountClientLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            agencyAndAccountClientLabel.bottomAnchor.constraint(equalTo: logoHeaderView.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: agencyAndAccountClientLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            viewCustom.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5),
            viewCustom.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewCustom.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewCustom.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .white
    }
}
