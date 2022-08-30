//
//  FLExtension+Double.swift
//  FLSwiftyFoundation
//
//  Created by FeliksLv on 2022/8/30.
//

import Foundation

public extension Double {
    var ex: FLExtension<Double> { FLExtension(self) }
}

public extension FLExtension where Base == Double {

    // double --> 00:00
    func timeToStr() -> String {
        let time = value
        let intTime = Int(time)
        let minute = intTime / 60
        let second = intTime % 60
        return String(format: "%02d:%02d", minute, second)
    }
}
