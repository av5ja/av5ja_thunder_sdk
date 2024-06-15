//
//  CoopGrade+Id.swift
//  Thunder
//
//  Created by devonly on 2024/05/05.
//  Copyright © 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

public extension CoopGrade {
    // swiftlint:disable:next type_name
    enum Id: UndefinedRawRepresentable, InternalCode {
        public typealias RawValue = Int

        public static var allCases: [Self] {
            [
                .Grade00,
                .Grade01,
                .Grade02,
                .Grade03,
                .Grade04,
                .Grade05,
                .Grade06,
                .Grade07,
                .Grade08,
            ]
        }

        public var rawValue: RawValue {
            switch self {
            case .Grade00:
                return 0
            case .Grade01:
                return 1
            case .Grade02:
                return 2
            case .Grade03:
                return 3
            case .Grade04:
                return 4
            case .Grade05:
                return 5
            case .Grade06:
                return 6
            case .Grade07:
                return 7
            case .Grade08:
                return 8
            case .Undefined(let rawValue):
                return rawValue
            }
        }

        case Grade00
        case Grade01
        case Grade02
        case Grade03
        case Grade04
        case Grade05
        case Grade06
        case Grade07
        case Grade08
        case Undefined(RawValue)
    }
}
 
