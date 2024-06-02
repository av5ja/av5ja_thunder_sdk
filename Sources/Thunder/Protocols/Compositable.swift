//
//  Compositable.swift
//  Thunder
//
//  Created by devonly on 2024/05/05.
//  Copyright © 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

public protocol Compositable: CaseIterable, Equatable where AllCases.Index == Int {
    // swiftlint:disable:next type_name
    associatedtype Id: UndefinedRawRepresentable
    associatedtype Key: UndefinedRawRepresentable
}
