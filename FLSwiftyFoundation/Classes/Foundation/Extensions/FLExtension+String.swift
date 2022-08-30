//
//  FLExtension+String.swift
//  FLSwiftyFoundation
//
//  Created by FeliksLv on 2022/8/30.
//

import Foundation

public extension String {
    var ex: FLExtension<String> { FLExtension(self) }
}

public extension FLExtension where Base == String {

    func asURL() -> URL? {
        URL(string: value)
    }
    
    var isValidUrl: Bool {
        URL(string: value) != nil
    }
}
