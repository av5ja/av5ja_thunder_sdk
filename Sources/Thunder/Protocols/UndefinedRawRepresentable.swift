//
//  UndefinedRawRepresentable.swift
//  SP3HashKey
//
//  Created by tkgstrator on 2024/02/24.
//  Copyright @ 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

public protocol UndefinedRawRepresentable: RawRepresentable, CaseIterable, Comparable, Hashable, Codable, Identifiable, Equatable where RawValue: Equatable, AllCases.Index == Int {
    static func Undefined(_ value: RawValue) -> Self
    
    var id: RawValue { get }
    var index: Self.AllCases.Index? { get }
}

extension UndefinedRawRepresentable {
    public var id: RawValue { rawValue }
    
    public init(rawValue: RawValue) {
        self = Self.allCases.first(where: { $0.rawValue == rawValue }) ?? .Undefined(rawValue)
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
    
    public var index: Self.AllCases.Index? {
        Self.allCases.firstIndex(of: self)
    }
}
