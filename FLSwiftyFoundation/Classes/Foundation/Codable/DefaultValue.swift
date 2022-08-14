//
//  DefaultValue.swift
//  FLSwiftyFoundation
//
//  Created by Feliks Lv on 2022/8/14.
//

import Foundation


public protocol DefaultValue {
    associatedtype Value: Codable
    
    static var defaultValue: Value { get }
}

@propertyWrapper
public struct Default<T: DefaultValue>: Codable {
    public var wrappedValue: T.Value
    
    public init(wrappedValue: T.Value) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.Value.self)) ?? T.defaultValue
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(
        _ type: Default<T>.Type,
        forKey key: Key
    ) throws -> Default<T> where T: DefaultValue {
        try decodeIfPresent(type, forKey: key) ?? Default(wrappedValue: T.defaultValue)
    }
}


extension Bool: DefaultValue {
    public static var defaultValue = false
}

extension Int: DefaultValue {
    public static var defaultValue = 0
}

extension String: DefaultValue {
    public static var defaultValue = ""
}
