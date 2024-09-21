//
//  CoopRecordQuery.swift
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

public final class CoopRecordQuery: DispatchType {
    public typealias ResponseType = Response

    public let version: Int = 1
    public let hash: SHA256Hash = .CoopRecordQuery

    init() {}

    public struct Response: Codable {
        public let stageRecords: [CoopStageRecord]
        public let enemyRecords: [CoopEnemyRecord]
//        public let assetURLs: [URL]
    }

    public struct CoopEnemyRecord: Codable {
        public let enemyId: CoopEnemyInfo.Id
        public let count: Int
    }

    public struct CoopStageRecord: Codable {
        public let goldenIkuraNum: Int?
        public let grade: CoopGrade.Id
        public let gradePoint: Int
        public let stageId: CoopStage.Id
        public let startTime: Date?
        public let endTime: Date?
        public let trophy: String?
        public let rank: Int?
    }
}
