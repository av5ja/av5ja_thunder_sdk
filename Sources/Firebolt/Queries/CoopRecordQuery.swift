//
//  CoopRecordQuery.swift
//  Thunder
//
//  Created by devonly on 2023/12/03.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

public final class CoopRecordQuery: RequestType {
    public typealias ResponseType = Response

    public let hash: SHA256Hash = .CoopRecordQuery

    init() {}

    public struct Response: Codable {
        public let stageRecords: [CoopStageRecord]
        public let enemyRecords: [CoopEnemyRecord]
        public let URLConvertibles: [URL]
    }

    public struct CoopEnemyRecord: Codable {
        public let enemyId: CoopEnemyInfo.Id
        public let count: Int
    }

    public struct CoopStageRecord: Codable {
        public let goldenIkuraNum: Int?
        public let grade: CoopGradeId
        public let gradePoint: Int
        public let stageId: CoopStage.Id
        public let startTime: Date?
        public let endTime: Date?
        public let trophy: String?
        public let rank: Int?
    }
}
