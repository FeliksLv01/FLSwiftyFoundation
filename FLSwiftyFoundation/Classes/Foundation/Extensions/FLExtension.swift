//
//  FLExtension.swift
//  FLSwiftyFoundation
//
//  Created by FeliksLv on 2022/8/30.
//

import Foundation

public struct FLExtension<Base> {
    var value: Base

    init(_ value: Base) {
        self.value = value
    }
}
