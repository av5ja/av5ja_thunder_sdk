//
//  CoopMode.swift
//  SP3Request
//
//  Created by devonly on 2022/11/24.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum CoopMode: String, CaseIterable, Codable, Identifiable {
    public var id: String { rawValue }

    case REGULAR
    case LIMITED
    case PRIVATE_CUSTOM
    case PRIVATE_SCENARIO
}
