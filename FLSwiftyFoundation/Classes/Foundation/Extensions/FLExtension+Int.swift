//
//  FLExtension+Int.swift
//  FLSwiftyFoundation
//
//  Created by FeliksLv on 2022/8/30.
//

import Foundation

public extension Int {
    var ex: FLExtension<Int> { FLExtension(self) }
}

public extension FLExtension where Base == Int {

    /// num --> xxx万/xxx亿
    func countToStr() -> String {
        if value < 100000 {
            return "\(value)"
        }
        let count = value / 10000
        if count / 10000 == 0 {
            return "\(count)万"
        }
        let floatCount = Float(count) / 10000
        return String(format: "%.1f亿", floatCount)
    }
}
