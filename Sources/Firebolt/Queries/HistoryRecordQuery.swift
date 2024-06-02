//
//  HistoryRecordQuery.swift
//  Thunder
//
//  Created by devonly on 2023/09/05.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

internal final class HistoryRecordQuery: RequestType {
    typealias ResponseType = Response

    let hash: SHA256Hash = .HistoryRecordQuery

    init() {}

    struct Response: Codable {
        let data: DataClass

        var urls: Set<URL> {
            Set(data.playHistory.allBadges.map(\.image.url))
        }
    }

    struct DataClass: Codable {
        let currentPlayer: CurrentPlayer
        let playHistory: PlayHistory
    }

    struct CurrentPlayer: Codable {
        let byname: String
        let name: String
        let nameId: String
        let nameplate: NamePlate
        let userIcon: UserIcon
    }

    struct UserIcon: Codable {
        let url: URL
    }

    struct PlayHistory: Codable {
        let allBadges: [IdHashURL<BadgeInfo.Id, BadgeInfo.Hash>]
    }
}
