//
//  URLConvertible.swift
//  Thunder
//
//  Created by devonly on 2024/05/05.
//  Copyright © 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

public protocol URLConvertible: UndefinedRawRepresentable {
    var path: String { get }
    var assetURL: URL? { get }
}

extension URLConvertible {
    var documentURL: URL {
        // swiftlint:disable:next force_unwrapping
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}

extension URLConvertible where RawValue == String {
    public var assetURL: URL? {
        documentURL.appendingPathComponent(path).appendingPathComponent(rawValue).appendingPathExtension("png")
    }
}
