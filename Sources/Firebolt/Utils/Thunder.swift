//
//  Thunder.swift
//  Firebolt
//
//  Created by devonly on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public enum Thunder {
    // swiftlint:disable:next force_cast
    static let bundleShortVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    // swiftlint:disable:next force_cast
    static let bundleVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
}
