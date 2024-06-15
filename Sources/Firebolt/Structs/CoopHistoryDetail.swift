//
//  CoopHistoryDetail.swift
//  Firebolt
//
//  Created by devonly on 2022/11/26.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation
import Mudmouth

public enum CoopHistoryDetail {
    public struct Id: Codable {
        public let nplnUserId: String
        public let playTime: Date
        public let uuid: UUID
        
        init(_ value: String) throws {
            let formatter: DateFormatter = .id
            guard let decodedString = value.base64DecodedString,
                  let nplnUserId: String = decodedString.capture(pattern: #"-u-([a-z0-9]{20})"#, group: 1),
                  let playTime: Date = decodedString.capture(pattern: #":([T0-9]{15})"#, group: 1).flatMap({ formatter.date(from: $0) }),
                  let uuid: UUID = decodedString.capture(pattern: #"_([a-f0-9-]{36})$"#, group: 1).flatMap({ UUID(uuidString: $0) })
            else {
                throw SPError.ResponseSerializationFailed
            }
            self.nplnUserId = nplnUserId
            self.playTime = playTime
            self.uuid = uuid
        }

        public init(nplnUserId: String, playTime: Date, uuid: UUID) {
            self.nplnUserId = nplnUserId
            self.playTime = playTime
            self.uuid = uuid
        }

        /// BASE64エンコードしたオリジナルのID
        public var id: String {
            let formatter: DateFormatter = .id
            let playTime: String = formatter.string(from: playTime)
            return "CoopHistoryDetail-u-\(nplnUserId):\(playTime)_\(uuid.uuidString.lowercased())".base64EncodedString
        }
    }
}

fileprivate extension DateFormatter {
    static let id: DateFormatter = {
        let formatter: DateFormatter = .init()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter
    }()
}
