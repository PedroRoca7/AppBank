//
//  MyAccountViewController.swift
//  AppBank
//
//  Created by Pedro Henrique on 21/03/24.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift


final class MyAccountViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    lazy var viewScreen: MyAccountView = {
        let element = MyAccountView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
        
    override func loadView() {
        view = viewScreen
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewScreen.myDataButton.button.rx.tap.bind {
            let teste = MyDataFactory.makeModule()
            self.navigationController?.pushViewController(teste, animated: true)
        }.disposed(by: disposeBag)
    }
    
    
}
