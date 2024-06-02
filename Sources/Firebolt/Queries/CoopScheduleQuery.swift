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
import SP3KeyHash

public final class CoopScheduleQuery: RequestType {
    public typealias ResponseType = Response
   
    public let baseURL: URL = {
#if DEBUG
#if targetEnvironment(simulator)
        .init(unsafeString: "http://localhost:3030")
#else
        .init(unsafeString: "https://dev.splatnet3.com")
#endif
#else
        Bundle.main.env == .APP_STORE
        ? .init(unsafeString: "https://api.splatnet3.com")
        : .init(unsafeString: "https://dev.splatnet3.com")
#endif
    }()
    public let path: String = "v3/schedules"
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
