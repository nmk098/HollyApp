//
//  extension + UIButton.swift
//  HollyApp
//
//  Created by Никита Курюмов on 02.01.23.
//


import UIKit

extension UIButton {
    func pulsate() {
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.fromValue = 0.95
        springAnimation.toValue = 1
        springAnimation.duration = 0.6
        springAnimation.autoreverses = true
        springAnimation.repeatCount = 1
        springAnimation.initialVelocity = 0.5
        springAnimation.damping = 1
        layer.add(springAnimation, forKey: nil)
    }
}
