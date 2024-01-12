//
//  ScreenPixViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/10/23.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class ScreenPixViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    lazy var viewScreen: ScreenPixView = {
        let view = ScreenPixView()
        view.backgroundColor = .backgroundColor
        return view
    }()
    
    private var viewModel: ScreenPixViewModeling
    
    // MARK: Inits
    
    init(viewModel: ScreenPixViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTapped()
        tappedButtonMakePix()
    }
}

private extension ScreenPixViewController {
    func tappedButtonMakePix() {
        viewScreen.makePixButton.rx.tap.bind {
            guard let name = self.viewScreen.nameReceivePixTextField.text, !name.isEmpty,
                  let value = self.viewScreen.valuePixTextField.text, !value.isEmpty,
                  let description = self.viewScreen.descriptionTextField.text, !description.isEmpty
            else {  Alert.showBasicAlert(title: "Erro", message: "Preencha todos os campos.", viewController: self) {}
                return }
            let valueNegative = Double(value)
            self.viewModel.makePix(modelInformations: ExtractModel(id: 0, type: 1, about: description, amount: -(valueNegative ?? 0.0)))
        }.disposed(by: disposeBag)
    }
}

extension ScreenPixViewController: ScreenPixViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            Alert.showBasicAlert(title: "Sucesso", message: "Pix realizado com sucesso", viewController: self) {
                self.viewModel.showHomeScreen()
            }
        }
    }
    
    func failure() {
        DispatchQueue.main.async {
            Alert.showActionSheet(title: "Erro", message: "Erro ao realizar Pix", viewController: self) { result in
                if result == false {
                    self.viewModel.showHomeScreen()
                }
            }
        }
    }
    
    
}
