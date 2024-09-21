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
        public let startTime: Date?
        public let endTime: Date?
        public let mode: CoopMode
        public let rule: CoopRule
        public let stageId: CoopStage.Id
        public let bossId: CoopBossInfo.Id?
        public let weaponList: [WeaponInfoMain.Id]
        public let rareWeapons: [WeaponInfoMain.Id]
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(mode, forKey: .mode)
            try container.encode(rule, forKey: .rule)
            try container.encode(stageId, forKey: .stageId)
            try container.encode(weaponList, forKey: .weaponList)
            try container.encode(rareWeapons, forKey: .rareWeapons)
            if let startTime: Date = startTime {
                try container.encode(startTime, forKey: .startTime)
            } else {
                try container.encodeNil(forKey: .startTime)
            }
            if let endTime: Date = endTime {
                try container.encode(endTime, forKey: .endTime)
            } else {
                try container.encodeNil(forKey: .endTime)
            }
            if let bossId: CoopBossInfo.Id = bossId {
                try container.encode(bossId, forKey: .bossId)
            } else {
                try container.encodeNil(forKey: .bossId)
            }
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url: URL = .init(unsafeString: "https://av5ja-dev.lemonandchan.workers.dev/v3/schedules")
        var request: URLRequest = .init(url: url)
        request.method = .get
        request.timeoutInterval = TimeInterval(10)
        return request
    }
}
