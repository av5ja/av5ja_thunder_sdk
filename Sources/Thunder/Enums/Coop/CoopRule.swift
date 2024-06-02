//
//  CoopRule.swift
//  Thunder
//
//  Created by devonly on 2022/11/24.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum CoopRule: String, CaseIterable, Codable, Identifiable {
    public var id: String { rawValue }

    case REGULAR
    case BIG_RUN
    case TEAM_CONTEST
}
