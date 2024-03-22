//
//  PixViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 22/03/24.
//

import Foundation

protocol PixViewModelProtocol: AnyObject {
    func success()
    func failure()
}

protocol PixViewModeling {
    func makePix(modelInformations: ExtractModel)
    var delegate: PixViewModelProtocol? { get set }
}

class PixViewModel: PixViewModeling {
    
    private var serviceViewModel: ServiceViewModeling
   
    weak var delegate: PixViewModelProtocol?
    
    init(serviceViewModel: ServiceViewModeling) {
        self.serviceViewModel = serviceViewModel
    }
    
    public func makePix(modelInformations: ExtractModel) {
        serviceViewModel.makePix(modelInformations: modelInformations) { result in
            if result == true {
                self.delegate?.success()
            } else {
                self.delegate?.failure()
            }
        }
    }
}
