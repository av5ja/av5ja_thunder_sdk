//
//  WeaponRecordQuery.swift
//  Thunder
//
//  Created by devonly on 2023/09/05.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Alamofire
import Foundation

public final class WeaponRecordQuery: DispatchType {
    public typealias ResponseType = Response

    public let version: Int = 1
    public let hash: SHA256Hash = .WeaponRecordQuery

    init() {}
    
    public struct Response: Codable {
//        public let assetURLs: [URL]
    }
}
