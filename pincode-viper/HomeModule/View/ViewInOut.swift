//
//  ViewInOut.swift
//  pincode-viper
//
//  Created by SemjonG on 20/08/2022.
//  Copyright © 2022 Company. All rights reserved.
//

import Foundation

// MARK: - View Input
protocol ViewInput: AnyObject {
    func showFormattedPincode(_ string: String)
}

// MARK: - View Output
protocol ViewOutput {
    func didTriggerViewReadyEvent()
    func didTriggerViewWillAppearEvent()
    func didPressGeneratePincodeAction()
}
