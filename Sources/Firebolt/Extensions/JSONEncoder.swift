//
//  JSONEncoder.swift
//  Firebolt
//
//  Created by devonly on 2021/11/20.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

extension JSONEncoder {
    convenience init(dateEncodingStragety: JSONEncoder.DataEncodingStrategy) {
        self.init()
        self.dateEncodingStrategy = dateEncodingStrategy
    }
}

public extension JSONEncoder.DateEncodingStrategy {
    /// 1970-01-01T00:00:00.000Z
    /// 1970-01-01T00:00:00.000+00:00
    static let atom: Self = custom {
        let formatter: ISO8601DateFormatter = .init()
        formatter.formatOptions.insert(.withFractionalSeconds)
        let stringValue: String = formatter.string(from: $0)
        var container = $1.singleValueContainer()
        try container.encode(stringValue)
    }
}
