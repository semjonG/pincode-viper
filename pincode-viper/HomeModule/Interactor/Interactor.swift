//
//  Interactor.swift
//  pincode-viper
//
//  Created by SemjonG on 20/08/2022.
//  Copyright © 2022 Company. All rights reserved.
//

import Foundation

final class Interactor {
    
    weak var output: InteractorOutput?
    var service: PincodeService?
    
}


// MARK: - Interactor Input
extension Interactor: InteractorInput {
    func fetchPincode() {
        guard let pincode = service?.fetchPincode() else { return }
        
        output?.didFinishFetchingPincode(pincode)
    }
}
