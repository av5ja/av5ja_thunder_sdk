//
//  CoopRule+String.swift
//  Thunder
//
//  Created by devonly on 2022/11/24.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

extension CoopRule: LocalizableString {
    public var description: String {
        switch self {
        case .REGULAR:
            return NSLocalizedString(LocalizedType.CoopHistoryRegular.rawValue, tableName: nil, bundle: .module, comment: "")
        case .BIG_RUN:
            return NSLocalizedString(LocalizedType.CoopHistoryBigrun.rawValue, tableName: nil, bundle: .module, comment: "")
        case .TEAM_CONTEST:
            return NSLocalizedString(LocalizedType.CoopHistoryTeamContest.rawValue, tableName: nil, bundle: .module, comment: "")
        }
    }
}
