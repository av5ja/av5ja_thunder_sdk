//
//  CoopEnemyInfo+URL.swift
//  Thunder
//
//  Created by tkgstrator on 2024/05/05.
//  Copyright @ 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

extension CoopEnemyInfo.Key: URLConvertible {
    public var path: String {
        "resources/prod/v3/coop_enemy_img/"
    }
}

extension CoopEnemyInfo.Id: URLConvertible {
    public var path: String {
        "resources/prod/v3/coop_enemy_img/"
    }
    
    public var assetURL: URL? {
        guard let index: Int = Self.allCases.firstIndex(of: self) else {
            return nil
        }
        return CoopEnemyInfo.Key.allCases[index].assetURL
    }
}
