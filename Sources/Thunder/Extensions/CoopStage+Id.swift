//
//  CoopStage+Id.swift
//  Thunder
//
//  Created by devonly on 2024/05/05.
//  Copyright © 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

extension CoopStage {
    // swiftlint:disable:next type_name
    public enum Id: UndefinedRawRepresentable, HashKey {
        public typealias RawValue = Int
        
        public static var allCases: [Self] {
            [
                .Carousel,
                .District,
                .Factory,
                .Section,
                .Shakedent,
                .Shakehighway,
                .Shakelift,
                .Shakerail,
                .Shakeship,
                .Shakespiral,
                .Shakeup,
                .Temple,
                .Tutorial,
                .Unknown,
                .Upland,
            ]
        }
        
        public var rawValue: RawValue {
            switch self {
            case .Carousel:
                return 100
            case .District:
                return 106
            case .Factory:
                return 104
            case .Section:
                return 105
            case .Shakedent:
                return 7
            case .Shakehighway:
                return 8
            case .Shakelift:
                return 4
            case .Shakerail:
                return 9
            case .Shakeship:
                return 6
            case .Shakespiral:
                return 2
            case .Shakeup:
                return 1
            case .Temple:
                return 103
            case .Tutorial:
                return 0
            case .Unknown:
                return -999
            case .Upland:
                return 102
            case .Undefined(let rawValue):
                return rawValue
            }
        }
        
        case Carousel
        case District
        case Factory
        case Section
        case Shakedent
        case Shakehighway
        case Shakelift
        case Shakerail
        case Shakeship
        case Shakespiral
        case Shakeup
        case Temple
        case Tutorial
        case Unknown
        case Upland
        case Undefined(RawValue)
    }
}
