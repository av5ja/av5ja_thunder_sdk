//
//  HistoryRecordQuery.swift
//  Thunder
//
//  Created by devonly on 2023/09/05.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Alamofire
import Foundation
import Thunder

internal final class HistoryRecordQuery: RequestType {
    typealias ResponseType = Response

    let hash: SHA256Hash = .HistoryRecordQuery

    init() {}

    struct Response: Codable {
    }
}
