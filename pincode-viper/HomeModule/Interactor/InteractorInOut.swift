//
//  InteractorInOut.swift
//  pincode-viper
//
//  Created by SemjonG on 20/08/2022.
//  Copyright © 2022 Company. All rights reserved.
//

import Foundation

// MARK: - Interactor Input
protocol InteractorInput {
    func fetchPincode()
}

// MARK: - Interactor Output
protocol InteractorOutput: AnyObject {
    func didFinishFetchingPincode(_ string: String)
}
