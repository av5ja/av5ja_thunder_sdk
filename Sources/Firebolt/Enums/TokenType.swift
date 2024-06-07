//
//  TokenType.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/26.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum TokenType: String, CaseIterable, Codable {
    case SESSION_TOKEN = "session_token"
    case ID_TOKEN = "id_token"
    case TOKEN = "token"
}
