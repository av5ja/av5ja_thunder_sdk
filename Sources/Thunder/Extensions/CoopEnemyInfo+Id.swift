//
//  CoopEnemyInfo+Id.swift
//  Thunder
//
//  Created by tkgstrator on 2024/05/05.
//  Copyright @ 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

extension CoopEnemyInfo.Id {
    public static var regular: [Self] {
        allCases.filter({ $0.rawValue <= 20 })
    }
}
