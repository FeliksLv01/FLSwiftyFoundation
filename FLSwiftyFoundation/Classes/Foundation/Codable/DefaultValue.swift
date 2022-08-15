//
//  DefaultValue.swift
//  FLSwiftyFoundation
//
//  Created by Feliks Lv on 2022/8/14.
//

import Foundation

public protocol DefaultValue {
    static var defaultValue: Self { get }
}

public typealias DefaultCodableValue = DefaultValue & Codable

@propertyWrapper
public struct Default<T: DefaultCodableValue>: Codable {
    public var wrappedValue: T
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.self)) ?? T.defaultValue
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

// 对于 key 不存在或者意外输入不同类型时使用默认的值
public extension KeyedDecodingContainer {
    func decode<T>(
        _ type: Default<T>.Type,
        forKey key: Key
    ) throws -> Default<T> where T: DefaultValue {
        try decodeIfPresent(type, forKey: key) ?? Default(wrappedValue: T.defaultValue)
    }
}

// 数组相关的处理，含义和 KeyedDecodingContainer 的处理一样
public extension UnkeyedDecodingContainer {
    mutating func decode<T>(
        _ type: Default<T>.Type
    ) throws -> Default<T> where T : DefaultCodableValue {
            try decodeIfPresent(type) ?? Default(wrappedValue: T.defaultValue)
    }
}

extension Bool: DefaultValue {
    public static var defaultValue: Bool = false
}

extension Int: DefaultValue {
    public static var defaultValue: Int = 0
}

extension String: DefaultValue {
    public static var defaultValue: String = ""
}

extension Double: DefaultValue {
    public static var defaultValue = 0.0
}

extension Float: DefaultValue {
    public static var defaultValue: Float = 0.0
}

extension Array: DefaultValue {
    public static var defaultValue: Array<Element> { [] }
}

extension Dictionary: DefaultValue {
    public static var defaultValue: Dictionary<Key, Value> { [:] }
}
