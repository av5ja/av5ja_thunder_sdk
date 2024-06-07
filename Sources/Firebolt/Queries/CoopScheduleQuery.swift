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

public final class CoopScheduleQuery: RequestType {
    public typealias ResponseType = Response
   
    public let method: HTTPMethod = .get
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
    }
}
