//
//  Keychain.swift
//  Firebolt
//
//  Created by devonly on 2021/11/20.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import KeychainAccess

extension Keychain {
    private var identifier: String {
        "8cfd2cfbf64614c7e9f87286f076fb45a5a36605627e38a633962d524c4abefb"
    }
    
    func set<T: Encodable>(value: T, key: String) throws {
        let encoder: JSONEncoder = .init()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        let data: Data = try encoder.encode(value)
        try set(data, key: key)
    }
    
    func get<T: Decodable>(key: String) throws -> T {
        let decoder: JSONDecoder = .init()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        guard let data: Data = try getData(key) else {
            throw DecodingError.valueNotFound(T.self, .init(codingPath: [], debugDescription: "Not Found"))
        }
        return try decoder.decode(T.self, from: data)
    }
    
    func get() throws -> UserInfo {
#if targetEnvironment(simulator)
        UserInfo(
            bulletToken: SecretKeys.bulletToken,
            gameWebToken: SecretKeys.gameWebToken,
            version: SecretKeys.xWebViewVer,
            userAgent: SecretKeys.userAgent
        )
#else
        try get(key: identifier)
#endif
    }
    
    func set(_ value: UserInfo?) throws {
        guard let value: UserInfo = value else {
            try? remove(identifier)
            return
        }
        try set(value: value, key: identifier)
    }
}
