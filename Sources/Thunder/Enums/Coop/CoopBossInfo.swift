//
//  CoopBossInfo.swift
//  Thunder
//
//  Created by tkgstrator on 2024/05/05.
//  Copyright @ 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

// swiftlint:disable:next type_body_length
public enum CoopBossInfo: Compositable {
    // swiftlint:disable:next type_body_length
    public enum Key: UndefinedRawRepresentable, HashKey {
        public typealias RawValue = String

        public static let allCases: AllCases = [
            .Random,
            .SakelienGiant,
            .SakeRope,
            .SakeJaw,
            .Triple,
        ]

        public var rawValue: RawValue {
            switch self {
            case .Random:
                return "473fffb2442075078d8bb7125744905abdeae651b6a5b7453ae295582e45f7d1"
            case .SakelienGiant:
                return "75f39ca054c76c0c33cd71177780708e679d088c874a66101e9b76b001df8254"
            case .SakeRope:
                return "0ee5853c43ebbef00ee2faecbd6c74f8a2d5e5b62b2cfa96d3838894b71381cb"
            case .SakeJaw:
                return "82905ebab16b4790142de406c78b1bf68a84056b366d9e19ae3360fb432fe0a9"
            case .Triple:
                return "a29cdb61df1464ef45ddedc7a042fd8f4fab0fd1c7c0c694df708d0b61e21222"
            case .Undefined(let rawValue):
                return rawValue
            }
        }

        case Random
        case SakelienGiant
        case SakeRope
        case SakeJaw
        case Triple
        case Undefined(RawValue)
    }

    // swiftlint:disable:next type_name type_body_length
    public enum Id: UndefinedRawRepresentable, InternalCode {
        public typealias RawValue = Int

        public static let allCases: AllCases = [
            .Random,
            .SakelienGiant,
            .SakeRope,
            .SakeJaw,
            .Triple,
        ]

        public var rawValue: RawValue {
            switch self {
            case .Random:
                return 31
            case .SakelienGiant:
                return 23
            case .SakeRope:
                return 24
            case .SakeJaw:
                return 25
            case .Triple:
                return 30
            case .Undefined(let rawValue):
                return rawValue
            }
        }

        case Random
        case SakelienGiant
        case SakeRope
        case SakeJaw
        case Triple
        case Undefined(RawValue)
    }
}
