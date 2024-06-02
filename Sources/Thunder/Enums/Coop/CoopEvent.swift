//
//  CoopEventId.swift
//  Thunder
//
//  Created by devonly on 2023/06/02.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

public enum CoopEvent {
    // swiftlint:disable:next type_name
    public enum Id: UndefinedRawRepresentable, InternalCode {
        public typealias RawValue = Int

        case WaterLevels
        case Rush
        case GoldieSeeking
        case Griller
        case TheMothership
        case Fog
        case CohockCharge
        case GiantTornado
        case MudmouthEruptions
        case Undefined(RawValue)

        public static let allCases: AllCases = [
            .WaterLevels,
            .Rush,
            .GoldieSeeking,
            .Griller,
            .TheMothership,
            .Fog,
            .CohockCharge,
            .GiantTornado,
            .MudmouthEruptions,
        ]

        public var rawValue: RawValue {
            switch self {
            case .WaterLevels:
                return 0
            case .Rush:
                return 1
            case .GoldieSeeking:
                return 2
            case .Griller:
                return 3
            case .TheMothership:
                return 4
            case .Fog:
                return 5
            case .CohockCharge:
                return 6
            case .GiantTornado:
                return 7
            case .MudmouthEruptions:
                return 8
            case .Undefined(let rawValue):
                return rawValue
            }
        }
    }
}
