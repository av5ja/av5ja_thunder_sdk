//
//  CoopHistoryQuery.swift
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

public final class CoopHistoryQuery: DispatchType {
    public typealias ResponseType = Response

    public let version: Int = 1
    public let hash: SHA256Hash = .CoopHistoryQuery

    public init() {}

    public struct Response: Codable {
        public let histories: [CoopHistory]
    }

    public struct CoopHistory: Codable {
        public let schedule: CoopScheduleQuery.Schedule
        public let results: [CoopHistoryDetail.Id]
    }
}
