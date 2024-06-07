//
//  URL.swift
//  Thunder
//
//  Created by devonly on 2023/12/03.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

extension URL {
    /// 文字列からUnsafeにURLを作成するイニシャライザ
    init(unsafeString: String) {
        // swiftlint:disable:next force_unwrapping
        self.init(string: unsafeString)!
    }
}
