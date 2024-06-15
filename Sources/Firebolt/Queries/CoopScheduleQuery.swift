//
//  CoopScheduleQuery.swift
//  Thunder
//
//  Created by devonly on 2023/12/03.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Alamofire
import Foundation
import Thunder

public final class CoopScheduleQuery: URLRequestConvertible {
    public typealias ResponseType = Response
   
    public let dateEncodingStragety: JSONDecoder.DateDecodingStrategy = .atom

    init() {}
    
    public struct Response: Codable {
        public let schedules: [Schedule]
    }

    public struct Schedule: Codable {
        public let id: String
        @NullCodable public var startTime: Date?
        @NullCodable public var endTime: Date?
        public let mode: CoopMode
        public let rule: CoopRule
        public let stageId: CoopStage.Id
        @NullCodable public var bossId: CoopBossInfo.Id?
        public let weaponList: [WeaponInfoMain.Id]
        public let rareWeapons: [WeaponInfoMain.Id]
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url: URL = .init(unsafeString: "https://api.splatnet3.com/v3/schedules")
        var request: URLRequest = .init(url: url)
        request.method = .get
        request.timeoutInterval = TimeInterval(10)
        return request
    }
}
