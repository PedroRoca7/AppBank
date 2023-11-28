//
//  ExtractViewModel.swift
//  AppBank
//
//  Created by Pedro Henrique on 04/09/23.
//

import Foundation

protocol ExtractViewModelProtocol: AnyObject {
    func success()
    func failure()
}

protocol ExtractViewModeling: AnyObject {
    var delegate: ExtractViewModelProtocol? { get set }
    var bankStatements: Extratcts { get }
    func loadStatements()
}

class ExtractViewModel: ExtractViewModeling {
    
    //MARK: Propertys
    
    var bankStatements: Extratcts = []
    private var serviceViewModel: ServiceViewModel
    private var coordinator: ExtractCoordinator
    weak var delegate: ExtractViewModelProtocol?
    
    //MARK: Init
    
    init(serviceViewModel: ServiceViewModel, coordinator: ExtractCoordinator) {
        self.serviceViewModel = serviceViewModel
        self.coordinator = coordinator
    }
   
    //MARK: Methods
    
    func loadStatements() {
        serviceViewModel.loadStatement { [weak self] result in
            guard let self = self else { return }
            if let result = result {
                self.bankStatements = result
            }
            self.delegate?.success()
        }
    }
}
