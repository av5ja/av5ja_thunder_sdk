//
//  StaticMedia.swift
//  Raccoon
//
//  Created by devonly on 2023/12/30
//  Copyright © 2023 Magi Corporation. All rights reserved.
//

import Foundation

public protocol StaticMedia: RawRepresentable, CaseIterable, Identifiable where RawValue == String {
    static var baseURL: URL { get }
    var path: String { get }
}

public extension StaticMedia {
    var id: RawValue { rawValue }
    
    /// ローカル読み込み用のURL
    static var baseURL: URL {
        // swiftlint:disable:next force_unwrapping
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
   
    /// ローカル読み込み用のURL
    var path: String {
        "static/media"
    }
   
    /// ローカル読み込み用のURL
    var assetURL: URL {
        Self.baseURL.appendingPathComponent(path).appendingPathComponent(rawValue)
    }
    
    init?(rawValue: String) {
        guard let value = Self.allCases.first(where: { $0.rawValue == rawValue }) else {
            return nil
        }
        self = value
    }
}
