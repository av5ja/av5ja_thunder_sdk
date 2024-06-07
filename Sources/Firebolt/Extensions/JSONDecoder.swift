//
//  JSONDecoder.swift
//  Firebolt
//
//  Created by devonly on 2021/11/20.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

extension JSONDecoder {
    convenience init(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) {
        self.init()
        self.dateDecodingStrategy = dateDecodingStrategy
    }
}

extension JSONDecoder.DateDecodingStrategy {
    /// 1970-01-01T00:00:00.000Z
    /// 1970-01-01T00:00:00.000+00:00
    static let atom: Self = custom {
        if #available(iOS 15.0, *) {
            return try .init(try $0.singleValueContainer().decode(String.self), strategy: .iso8601)
        } else {
            // Fallback on earlier versions
            let stringValue: String = try $0.singleValueContainer().decode(String.self)
            let formatter: ISO8601DateFormatter = .init()
            // swiftlint:disable:next force_unwrapping
            return formatter.date(from: stringValue)!
        }
    }
}
