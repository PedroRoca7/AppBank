//
//  WalletViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 19/03/24.
//

import UIKit
import RxSwift
import RxCocoa

final class WalletViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    lazy var viewScreen: WalletView = {
        let element = WalletView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func loadView() {
        view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertMoneyButtonTapped()
    }
    
    private func insertMoneyButtonTapped() {
        viewScreen.insertMoneyButton.button.rx.tap.bind {
            print("Button Tapped")
        }.disposed(by: disposeBag)
    }
    
}
