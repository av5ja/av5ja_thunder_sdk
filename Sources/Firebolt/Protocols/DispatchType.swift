//
//  DispatchType.swift
//  Firebolt
//
//  Created by devonly on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation
import Thunder

public protocol DispatchType: RequestType {
    /// バージョン
    var version: Int { get}
    /// パス
    var targetPath: String { get }
    /// Salmon StatsのURL
    var targetURL: URL { get }
    
    func asURLRequest(data: Data) throws -> URLRequest
}

extension DispatchType {
    public var targetURL: URL {
#if targetEnvironment(simulator)
        // swiftlint:disable:next force_unwrapping
        .init(string: "https://api.splatnet3.com")!
#else
        // swiftlint:disable:next force_unwrapping
        .init(string: "https://av5ja-dev.lemonandchan.workers.dev")!
#endif
    }
    
    public var targetPath: String {
        switch hash {
        case .CoopHistoryQuery:
            return "v\(version)/histories"
        case .CoopHistoryDetailQuery:
            return "v\(version)/results"
        case .CoopRecordQuery:
            return "v\(version)/records"
        case .WeaponRecordQuery:
            return "v\(version)/weapon_records"
        default:
            fatalError("This Query Is Not Implemented")
        }
    }
    
    public func asURLRequest(data: Data) throws -> URLRequest {
        var request: URLRequest = .init(url: targetURL.appendingPathComponent(targetPath))
        request.method = HTTPMethod.post
        request.timeoutInterval = TimeInterval(10)
        request.allHTTPHeaderFields = headers?.dictionary
        request.headers.add(.userAgent("av5ja/\(Thunder.bundleShortVersion)"))
        let parameters: [String: Any]? = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        return try encoding.encode(request, with: parameters)
    }
}
