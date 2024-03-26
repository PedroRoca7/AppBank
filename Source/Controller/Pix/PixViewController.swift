//
//  PixViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 22/03/24.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class PixViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    lazy var viewScreen: PixView = {
        let view = PixView()
        return view
    }()
    
    private var viewModel: PixViewModeling
    
    // MARK: Inits
    
    init(viewModel: PixViewModeling) {
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
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "Pix"
        navigationController?.navigationBar.tintColor = .black
    }
}


private extension PixViewController {
    func tappedButtonMakePix() {
        viewScreen.pixView.makePixButton.rx.tap.bind {
            guard let recipientName = self.viewScreen.pixView.recipientName.titleTextField.text, !recipientName.isEmpty,
                  let valuePix = self.viewScreen.pixView.valuePix.titleTextField.text, !valuePix.isEmpty
            else {  self.showBasicAlert(title: "Erro", message: "Nome do destinatário ou Valor do pix vazios.", viewController: self) {}
                return }
            let valueNegative = Double(valuePix)
            self.viewModel.makePix(modelInformations: ExtractModel(id: 0, type: 1, about: self.viewScreen.pixView.descriptionPix.titleTextField.text ?? "", amount: -(valueNegative ?? 0.0)))
        }.disposed(by: disposeBag)
    }
}

extension PixViewController: PixViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.showBasicAlert(title: "Sucesso", message: "Pix realizado com sucesso", viewController: self) {
                
            }
        }
    }
    
    func failure() {
        DispatchQueue.main.async {
            self.showActionSheet(title: "Erro", message: "Erro ao realizar Pix", viewController: self) { result in
                if result == false {
                    
                }
            }
        }
    }
}
extension PixViewController: AlertProtocol {}

