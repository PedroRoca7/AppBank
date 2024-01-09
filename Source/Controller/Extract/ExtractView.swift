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
    
    lazy var titleAccountLabel = LabelDefault(text: "Account", color: .white, font: .systemFont(ofSize: 14, weight: .bold))
    
    lazy var segmentedControl: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Input","All","Output"])
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.selectedSegmentIndex = 1
        seg.tintColor = .white
        return seg
    }()
    
    lazy var balanceLabel = LabelDefault(text: "Balance", color: .white, font: .systemFont(ofSize: 12, weight: .semibold))
    lazy var amountLabel = LabelDefault(text: "$ 0.00", color: .white, font: .systemFont(ofSize: 24, weight: .bold))
    
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
        addElementsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Add Elements e Constraints
    
    private func addElementsView() {
        setTitleAccountLabel()
        setSegmentedControl()
        setBalanceLabel()
        setAmountLabel()
        setTableView()
    }
        
    private func setTitleAccountLabel() {
        self.addSubview(titleAccountLabel)
        
        NSLayoutConstraint.activate([
            titleAccountLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10),
            titleAccountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setSegmentedControl() {
        self.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: titleAccountLabel.bottomAnchor, constant: 15),
            segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setBalanceLabel() {
        self.addSubview(balanceLabel)
        
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15),
            balanceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setAmountLabel() {
        self.addSubview(amountLabel)
        
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 10),
            amountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setTableView() {
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: amountLabel.bottomAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

