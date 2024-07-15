//
//  String.swift
//  Firebolt
//
//  Created by devonly on 2021/11/20.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

extension String {
    /// Base64文字列に変換する
    var base64EncodedString: String {
        // swiftlint:disable:next force_unwrapping
        data(using: .utf8)!
            .base64EncodedString()
            .replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }
    
    /// Base64文字列から復号する
    var base64DecodedString: String? {
        let formatedString: String = self + Array(repeating: "=", count: count % 4).joined()
        if let data = Data(base64Encoded: formatedString, options: [.ignoreUnknownCharacters]) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    /// 正規表現でマッチングし、合致した文字列をグループを指定して返す
    func capture(pattern: String, group: Int) -> String? {
        capture(pattern: pattern, group: [group]).first
    }

    /// 正規表現でマッチングし、合致した文字列をグループを指定して返す
    func capture(pattern: String, group: [Int]) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return []
        }
        guard let matches = regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) else {
            return []
        }
        return group.map { group -> String in
            // swiftlint:disable:next legacy_objc_type
            (self as NSString).substring(with: matches.range(at: group))
        }
    }

    /// 正規表現でマッチングし、合致した文字列を全て返す
    public func capture(pattern: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return []
        }
        let matches: [NSTextCheckingResult] = regex.matches(in: self, range: NSRange(location: 0, length: count))
        return matches.map { match in
            // swiftlint:disable:next legacy_objc_type
            (self as NSString).substring(with: match.range)
        }
    }
}
