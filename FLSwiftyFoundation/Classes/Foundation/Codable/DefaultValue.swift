//
//  DefaultValue.swift
//  FLSwiftyFoundation
//
//  Created by Feliks Lv on 2022/8/14.
//

import Foundation
import UIKit


public protocol DefaultValue {
    associatedtype CodableValue: Codable
    static func defaultValue() -> CodableValue
}

@propertyWrapper
public struct Default<T: DefaultValue>: Codable {
    public var wrappedValue: T.CodableValue
    
    public init(wrappedValue: T.CodableValue) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.CodableValue.self)) ?? T.defaultValue()
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(
        _ type: Default<T>.Type,
        forKey key: Key
    ) throws -> Default<T> where T: DefaultValue {
        try decodeIfPresent(type, forKey: key) ?? Default(wrappedValue: T.defaultValue())
    }
}


extension Bool: DefaultValue {
    public static func defaultValue() -> Bool { false }
}

extension Int: DefaultValue {
    public static func defaultValue() -> Int { 0 }
}

extension String: DefaultValue {
    public static func defaultValue() -> String { "" }
}

extension Array: DefaultValue where Element: Codable {
    public static func defaultValue() -> Array<Element> { [] }
}

extension Dictionary: DefaultValue where Key: Codable, Value: Codable {
    public static func defaultValue() -> Dictionary<Key, Value> { [:] }
}
