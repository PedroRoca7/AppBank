//
//  ScreenPixViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 20/10/23.
//

import Foundation

protocol ScreenPixViewModelProtocol: AnyObject {
    func success()
    func failure()
}

protocol ScreenPixViewModeling {
    func makePix(modelInformations: ExtractModel)
    func showHomeScreen()
    var delegate: ScreenPixViewModelProtocol? { get set }
}

class ScreenPixViewModel: ScreenPixViewModeling {
    
    private var serviceViewModel: ServiceViewModeling
    private var coordinator: ScreenPixCoordinating
    weak var delegate: ScreenPixViewModelProtocol?
    
    init(serviceViewModel: ServiceViewModeling, coordinator: ScreenPixCoordinating) {
        self.serviceViewModel = serviceViewModel
        self.coordinator = coordinator
    }
    
    func makePix(modelInformations: ExtractModel) {
        serviceViewModel.makePix(modelInformations: modelInformations) { result in
            if result == true {
                self.delegate?.success()
            } else {
                self.delegate?.failure()
            }
        }
    }
    
    func showHomeScreen() {
        coordinator.showHomeScreen()
    }
}
