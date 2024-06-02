//
//  WeaponInfoMain+Id.swift
//  Thunder
//
//  Created by devonly on 2023/12/30
//  Copyright © 2023 Magi Corporation. All rights reserved.
//

import Foundation

public extension WeaponInfoMain.Id {
    static let regular: AllCases = allCases.filter({ $0.rawValue < 20_000 && $0.rawValue >= 0 })
}
