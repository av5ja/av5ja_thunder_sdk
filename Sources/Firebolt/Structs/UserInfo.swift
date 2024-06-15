//
//  UserInfo.swift
//  Firebolt
//
//  Created by devonly on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public struct UserInfo: Codable, AuthenticationCredential, Identifiable {
    public struct Token: Codable {
        public let token: String
        public let expiresIn: Date
        
        public var requiresRefresh: Bool {
            expiresIn < .init()
        }
        
        public init(token: String) {
            self.token = token
            self.expiresIn = .init(timeIntervalSinceNow: 60 * 60 * 2)
        }
    }
    
    public let bulletToken: Token
    public let gameWebToken: JWT<GameWebToken.Token>
    public let version: String
    public let userAgent: String
    
    public var id: String {
        gameWebToken.payload.links.networkServiceAccount.id
    }
    public var requiresRefresh: Bool {
        bulletToken.requiresRefresh
    }

    public init(bulletToken: String, gameWebToken: String, version: String, userAgent: String) {
        self.bulletToken = Token(token: bulletToken)
        self.gameWebToken = JWT(rawValue: gameWebToken)
        self.version = version
        self.userAgent = userAgent
    }
}
