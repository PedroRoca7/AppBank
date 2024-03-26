//
//  CustomTitleAndTextField.swift
//  AppBank
//
//  Created by Pedro Henrique on 26/03/24.
//

import UIKit

final class CustomTitleAndTextField: UIStackView {
    
    private var widthLineTextField: CGFloat
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customSegoeUIFont(type: .bold, size: 16)
        element.textColor = .azulClaro
        return element
    }()
    
    lazy var titleTextField: UITextField = {
        let element = UITextField()
        element.textColor = .black
        element.font = .customSegoeUIFont(type: .bold, size: 16)
        element.borderStyle = UITextField.BorderStyle.none
        element.backgroundColor = .clear
        element.keyboardType = .default
        element.borderStyle = UITextField.BorderStyle.none
        element.widthAnchor.constraint(equalToConstant: widthLineTextField).isActive = true
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(5.0, 25 - 1, widthLineTextField, 0.5)
        bottomLine.backgroundColor = UIColor.cinzaEscuro.cgColor
        element.borderStyle = .none
        element.layer.addSublayer(bottomLine)
        return element
    }()
    
    init(textTitle: String, textTextField: String, widthLineTextField: CGFloat) {
        self.widthLineTextField = widthLineTextField
        super.init(frame: .zero)
        titleLabel.text = textTitle
        titleTextField.text = textTextField
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTitleAndTextField: ViewCodeUIView {
    func addElementsView() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(titleTextField)
    }
    
    func setupConstraints() {}
    
    func applyConditionSpecial() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
    }
}


