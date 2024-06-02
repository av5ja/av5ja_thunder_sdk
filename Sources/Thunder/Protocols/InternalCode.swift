//
//  InternalCode.swift
//  Thunder
//
//  Created by devonly on 2024/05/05.
//  Copyright © 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

public protocol InternalCode: UndefinedRawRepresentable {
    var code: RawValue { get }
}

extension InternalCode {
    public var code: RawValue {
        rawValue
    }
}
