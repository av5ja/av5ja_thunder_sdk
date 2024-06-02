//
//  JWT.swift
//  SP3Request
//
//  Created by devonly on 2022/11/26.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public struct JWT<T: PayloadType>: Codable {
    /// ヘッダー
    let header: Header
    /// ペイロード
    let payload: T
    /// 署名
    let signature: String

    public let rawValue: String

    public var isRefreshNeeded: Bool {
        Date() > payload.exp
    }

    internal struct Header: Codable {
        let alg: Algorithm
    }

    internal enum Algorithm: String, CaseIterable, Codable {
        case HS256
        case RS256
    }

    public init(rawValue: String) {
        let values: [String] = rawValue.components(separatedBy: ".")
        if values.count != 3 {
            fatalError("Unexpected format JWT")
        }

        let data: [Data] = values.compactMap(\.base64DecodedString).compactMap({ $0.data(using: .utf8) })
        let decoder: SPDecoder = .init(dateDecodingStrategy: .secondsSince1970)
        self.rawValue = rawValue
        // swiftlint:disable:next force_try
        self.header = try! decoder.decode(Header.self, from: data[0])
        // swiftlint:disable:next force_try
        self.payload = try! decoder.decode(T.self, from: data[1])
        self.signature = values[2]
    }
}

public extension JWT {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        let values: [String] = rawValue.components(separatedBy: ".")

        if values.count != 3 {
            throw SPError.Token(.DataCorrupted)
        }

        let data: [Data] = values.compactMap(\.base64DecodedString).compactMap({ $0.data(using: .utf8) })
        let decoder: SPDecoder = .init(dateDecodingStrategy: .secondsSince1970)
        self.rawValue = rawValue
        self.header = try decoder.decode(Header.self, from: data[0])
        self.payload = try decoder.decode(T.self, from: data[1])
        self.signature = values[2]
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
