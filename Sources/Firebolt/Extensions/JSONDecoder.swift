//
//  JSONDecoder.swift
//  Firebolt
//
//  Created by devonly on 2021/11/20.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {
    /// 1970-01-01T00:00:00.000Z
    /// 1970-01-01T00:00:00.000+00:00
    static let atom: Self = custom {
        try .init(try $0.singleValueContainer().decode(String.self), strategy: .iso8601)
    }
}
