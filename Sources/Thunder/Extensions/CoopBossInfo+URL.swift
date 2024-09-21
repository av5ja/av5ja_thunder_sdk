//
//  CoopBossInfo+URL.swift
//  Thunder
//
//  Created by tkgstrator on 2024/05/05.
//  Copyright @ 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

extension CoopBossInfo.Key: URLConvertible {
    public var path: String {
        "resources/prod/v3/coop_enemy_img/"
    }
}

extension CoopBossInfo.Id: URLConvertible {
    public var path: String {
        "resources/prod/v3/coop_enemy_img/"
    }

    public var assetURL: URL? {
        switch self {
        case .Random:
            return CoopBossInfo.Key.Random.assetURL
        case .SakelienGiant:
            return CoopBossInfo.Key.SakelienGiant.assetURL
        case .SakeRope:
            return CoopBossInfo.Key.SakeRope.assetURL
        case .SakeJaw:
            return CoopBossInfo.Key.SakeJaw.assetURL
        case .Triple:
            return CoopBossInfo.Key.Triple.assetURL
        case .Undefined:
            return nil
        }
    }
}
