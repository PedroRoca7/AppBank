//
//  ExtractView.swift
//  AppBank
//
//  Created by Pedro Henrique on 29/08/23.
//

import UIKit

class ExtractView: UIView {
    
    // MARK: Property
    
    private lazy var guide = self.safeAreaLayoutGuide
    
    // MARK: ElementsVisual
    
    lazy var titleAccountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Account"
        element.textColor = .white
        element.font = .systemFont(ofSize: 14, weight: .bold)
        return element
    }()

    lazy var segmentedControl: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Input","All","Output"])
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.selectedSegmentIndex = 1
        seg.tintColor = .white
        return seg
    }()
    
    lazy var balanceLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Balance"
        element.textColor = .white
        element.font = .systemFont(ofSize: 12, weight: .semibold)
        return element
    }()

    lazy var amountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "$ 0.00"
        element.textColor = .white
        element.font = .systemFont(ofSize: 24, weight: .bold)
        return element
    }()
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(CustomStatementTableViewCell.self, forCellReuseIdentifier: CustomStatementTableViewCell.identifier)
        tb.rowHeight = 150
        tb.estimatedRowHeight = 150
        tb.backgroundColor = .clear
        return tb
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

extension ExtractView: ViewCodeUIView {
    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        self.addSubview(titleAccountLabel)
        self.addSubview(segmentedControl)
        self.addSubview(balanceLabel)
        self.addSubview(amountLabel)
        self.addSubview(tableView)
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleAccountLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10),
            titleAccountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: titleAccountLabel.bottomAnchor, constant: 15),
            segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15),
            balanceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 10),
            amountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: amountLabel.bottomAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
