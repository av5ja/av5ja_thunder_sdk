//
//  PayloadType.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/26.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public protocol PayloadType: Codable {
    /// Audience
    var aud: String { get }
    /// Expiration Time
    var exp: Date { get }
    /// Type
    var typ: TokenType { get }
    /// Issued At
    var iat: Date { get }
    /// Validation
    var isValid: Bool { get }
}

public extension PayloadType {
    var isValid: Bool {
        Date() > exp
    }
}
