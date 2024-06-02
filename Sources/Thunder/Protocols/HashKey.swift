//
//  HashKeyswift
//  Thunder
//
//  Created by devonly on 2024/05/05.
//  Copyright © 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import CryptoKit
import Foundation

public protocol HashKey: UndefinedRawRepresentable {
    var hash: String { get }
}

extension HashKey {
    public var hash: String {
        // swiftlint:disable:next force_unwrapping
        SHA256.hash(data: String(describing: self).data(using: .utf8)!).map({ String(format: "%02x", $0) }).joined()
    }
}
