//
//  Presenter.swift
//  pincode-viper
//
//  Created by SemjonG on 20/08/2022.
//  Copyright © 2022 Company. All rights reserved.
//

import Foundation

final class Presenter: NSObject {
    
    weak var view: ViewInput?
    var interactor: InteractorInput?
    var router: RouterInput?
    weak var moduleOutput: ModuleOutput?
    
    
    // MARK: - Private
    
}


// MARK: - Module Input
extension Presenter: ModuleInput {
    
}


// MARK: - Interactor Output
extension Presenter: InteractorOutput {
    func didFinishFetchingPincode(_ string: String) {
        // подготовка данных для View
        view?.showFormattedPincode("ПИН-код получен: \(string)")
    }
}


// MARK: - View Output
extension Presenter: ViewOutput {
    func didPressGeneratePincodeAction() {
        interactor?.fetchPincode()
    }
    
    
    func didTriggerViewReadyEvent() {
        
    }
    
    func didTriggerViewWillAppearEvent() {
        
    }
    
}
