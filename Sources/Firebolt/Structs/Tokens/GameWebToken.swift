//
//  GameWebToken.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/26.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public enum GameWebToken {
    public struct Token: PayloadType {
        public let aud: String
        /// CoralUserId
        public let sub: Int
        public let exp: Date
        public let typ: TokenType
        public let iat: Date
        let links: Links
    }
    
    internal struct NetworkServiceAccount: Codable {
        let id: String
    }

    internal struct Links: Codable {
        let networkServiceAccount: NetworkServiceAccount
    }
}
