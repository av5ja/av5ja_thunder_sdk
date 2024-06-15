//
//  CoopResultQuery.swift
//  Thunder
//
//  Created by devonly on 2023/09/05.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Alamofire
import Foundation

public final class CoopResultQuery: URLRequestConvertible {
    public typealias ResponseType = Response
    public let histories: [CoopResultQuery.CoopHistory<Data>]
    
    public init(histories: [CoopResultQuery.CoopHistory<Data>]) {
        self.histories = histories
    }
    
    public struct Response<T: Codable>: Codable {
        public let histories: [CoopHistory<T>]
    }

    public struct CoopHistory<T: Codable>: Codable {
        public let schedule: CoopScheduleQuery.Schedule
        public let results: [T]
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url: URL = .init(unsafeString: "https://api.splatnet3.com/v3/results")
        var request: URLRequest = .init(url: url)
        request.method = .post
        request.timeoutInterval = TimeInterval(10)
        let parameters: [String: Any] = [
            "histories": histories.map({ history in
                [
                    "schedule": history.schedule.dictionaryObject,
                    "results": history.results.compactMap(\.dictionaryObject)
                ]
            })
        ]
        return try JSONEncoding.default.encode(request, with: parameters)
    }
}

fileprivate extension CoopScheduleQuery.Schedule {
    var dictionaryObject: [String: Any]? {
        let encoder: JSONEncoder = .init()
        encoder.dateEncodingStrategy = .iso8601
        guard let data: Data = try? encoder.encode(self) else {
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    }
}

fileprivate extension Data {
    var dictionaryObject: [String: Any]? {
        try? JSONSerialization.jsonObject(with: self) as? [String: Any]
    }
}
