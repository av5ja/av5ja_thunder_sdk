//
//  WeaponInfoSpecial+URL.swift
//  Thunder
//
//  Created by tkgstrator on 2024/05/05.
//  Copyright @ 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

extension WeaponInfoSpecial.Key: URLConvertible {
    public var path: String {
        "resources/prod/v3/special_img/blue"
    }
}

extension WeaponInfoSpecial.Id: URLConvertible {
    public var path: String {
        "resources/prod/v3/special_img/blue"
    }
    
    public var assetURL: URL? {
        guard let index: Int = WeaponInfoSpecial.Id.allCases.firstIndex(of: self) else {
            return WeaponInfoSpecial.Key.RandomGreen.assetURL
        }
        return WeaponInfoSpecial.Key.allCases[index].assetURL
    }
}
