//
//  PincodeService.swift
//  pincode-viper
//
//  Created by mac on 29.08.2022.
//

import Foundation

protocol PincodeServiceInput {
    func fetchPincode() -> String
}

class PincodeService: PincodeServiceInput {
    func fetchPincode() -> String {
        
//        sleep(2)
        return String(Int.random(in: 1000...9999))
    }
}
