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

public final class CoopHistoryDetailQuery: RequestType {
    public typealias ResponseType = Response

    public let hash: SHA256Hash = .CoopHistoryDetailQuery
    public let variables: [String: String]

    init(resultId: CoopHistoryDetail.Id) {
        self.variables = [
            "coopHistoryDetailId": resultId.id
        ]
    }

    public struct Response: Codable {
        public let id: CoopHistoryDetail.Id
        public let hash: String
        public let ikuraNum: Int
        public let goldenIkuraNum: Int
        public let goldenIkuraAssistNum: Int
        public let schedule: CoopScheduleQuery.Schedule
        public let jobResult: JobResult
        public let dangerRate: Decimal
        public let scale: [Int?]
        public let bossCounts: [Int]
        public let bossKillCounts: [Int]
        public let scenarioCode: String?
        public let playTime: Date
        public let myResult: MemberResult
        public let otherResults: [MemberResult]
        public let waveDetails: [WaveResult]
        
        public var members: [MemberResult] {
            [myResult] + otherResults
        }
        
        public var isPrivate: Bool {
            schedule.mode == .PRIVATE_CUSTOM || schedule.mode == .PRIVATE_SCENARIO
        }
    }

    public struct JobResult: Codable {
        public let failureWave: Int?
        public let isClear: Bool
        public let bossId: CoopBossInfo.Id?
        // swiftlint:disable:next discouraged_optional_boolean
        public let isBossDefeated: Bool?
    }

    public struct WaveResult: Codable {
        public let hash: String
        public let id: Int
        public let eventType: CoopEvent.Id
        public let quotaNum: Int?
        public let goldenIkuraNum: Int?
        public let goldenIkuraPopNum: Int
        public let waterLevel: CoopWaterLevel.Id
        public let isClear: Bool
    }
    
    public struct TextColor: Codable {
        public let a: Decimal
        public let b: Decimal
        public let g: Decimal
        public let r: Decimal
    }
    
    public struct Background: Codable {
        public let textColor: TextColor
        public let id: NamePlateBgInfo.Id
    }

    public struct Nameplate: Codable {
        public let badges: [BadgeInfo.Id?]
        public let background: Background
    }
    
    public struct MemberResult: Codable {
        public let hash: String
        public let nplnUserId: String
        public let goldenIkuraNum: Int
        public let bossKillCounts: [Int?]
        public let uniform: CoopSkinInfo.Id
        public let bossKillCountsTotal: Int
        public let ikuraNum: Int
        public let isMyself: Bool
        public let nameplate: Nameplate
        public let helpCount: Int
        public let deadCount: Int
        public let specialId: WeaponInfoSpecial.Id?
        public let weaponList: [WeaponInfoMain.Id]
        public let nameId: String
        public let goldenIkuraAssistNum: Int
        public let species: Species
        public let name: String
        public let byname: String
        public let gradeId: CoopGrade.Id?
        public let gradePoint: Int?
        public let smellMeter: Int?
        public let jobBonus: Int?
        public let jobScore: Int?
        public let kumaPoint: Int?
        public let jobRate: Decimal?
        public let specialCounts: [Int]
    }
}
