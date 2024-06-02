//
//  UserInfo.swift
//  SP3Request
//
//  Created by devonly on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public struct UserInfo: Codable, AuthenticationCredential {
    public struct Token: Codable {
        public let token: String
        public let expiresIn: Date
        
        public var isRefreshNeeded: Bool {
            expiresIn < .init()
        }
    }
}
