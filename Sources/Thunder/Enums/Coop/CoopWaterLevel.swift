//
//  CoopWaterLevel.swift
//  Thunder
//
//  Created by devonly on 2023/01/30.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

public enum CoopWaterLevel {
    // swiftlint:disable:next type_name
    public enum Id: UndefinedRawRepresentable {
        public typealias RawValue = Int

        public static var allCases: AllCases = [
            .LowTide,
            .NormalTide,
            .HighTide,
        ]

        public var rawValue: RawValue {
            switch self {
            case .LowTide:
                return 0
            case .NormalTide:
                return 1
            case .HighTide:
                return 2
            case .Undefined(let rawValue):
                return rawValue
            }
        }

        case LowTide
        case NormalTide
        case HighTide
        case Undefined(RawValue)
    }
}
