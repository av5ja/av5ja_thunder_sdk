//
//  Species.swift
//  Thunder
//
//  Created by devonly on 2022/11/24.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum Species: UndefinedRawRepresentable {
    public typealias RawValue = String

    case Inkling
    case Octoling
    case Undefined(RawValue)

    public static let allCases: AllCases = [
        .Inkling,
        .Octoling,
    ]

    public var rawValue: String {
        switch self {
        case .Inkling:
            return "INKLING"
        case .Octoling:
            return "OCTOLING"
        case .Undefined(let rawValue):
            return rawValue
        }
    }
}
