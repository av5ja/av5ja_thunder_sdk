//
//  WeaponRecordQuery.swift
//  Thunder
//
//  Created by devonly on 2023/09/05.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

public final class WeaponRecordQuery: RequestType {
    public typealias ResponseType = Response

    public let hash: SHA256Hash = .WeaponRecordQuery

    init() {}
    
    public struct Response: Codable {
        public let URLConvertibles: [URL]
    }
}
