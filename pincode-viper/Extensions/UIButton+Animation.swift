//
//  UIButton+Animation.swift
//  pincode-viper
//
//  Created by mac on 29.08.2022.
//

import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        layer.add(flash, forKey: nil)
    }
    
// put this in UIButton code
//    UIView.animate(withDuration: 1.0, animations:{
//        button.frame = CGRect(x: button.frame.origin.x + 25,
//                              y: button.frame.origin.y + 25,
//                              width: button.frame.size.width,
//                              height: button.frame.size.height)
//        })

}
