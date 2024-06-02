//
//  RequestType.swift
//  SP3Request
//
//  Created by devonly on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation
import Thunder

public protocol RequestType: URLRequestConvertible, RequestInterceptor {
    associatedtype ResponseType: Codable
    /// メソッド
    var method: HTTPMethod { get }
    /// パラメーター
    var parameters: Parameters? { get }
    /// パス
    var path: String { get }
    /// ヘッダー
    var headers: HTTPHeaders? { get }
    /// 基本となるURL
    var baseURL: URL { get }
    /// エンコーディング方式
    var encoding: ParameterEncoding { get }
    /// 日付のデコーダー
    var dateEncodingStragety: JSONDecoder.DateDecodingStrategy { get }
}

public extension RequestType {
    /// パラメータのエンコード方式
    var encoding: ParameterEncoding {
        switch method {
        case .post, .put, .patch:
            return JSONEncoding.default
        default:
            return URLEncoding.queryString
        }
    }

    var dateEncodingStragety: JSONDecoder.DateDecodingStrategy {
        .atom
    }

    /// ヘッダー
    var headers: HTTPHeaders? {
        nil
    }

    /// パラメーター
    var parameters: Parameters? {
        nil
    }

    /// URLリクエストに変換する
    func asURLRequest() throws -> URLRequest {
        // swiftlint:disable:next force_unwrapping
        let url: URL = .init(string: baseURL.appendingPathComponent(path).absoluteString.removingPercentEncoding!)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(5)
        request.allHTTPHeaderFields = headers?.dictionary
        // パラメータが設定されていればエンコードして設定する
        if let params = parameters {
            return try encoding.encode(request, with: params)
        }
        return request
    }
}

// extension RequestType {
//    var version: Int {
//        1
//    }
//    
//    var method: HTTPMethod {
//        .post
//    }
//    
//    var variables: [String: String] {
//        [:]
//    }
//    
//    var parameters: Parameters? {
//        nil
//    }
//    
//    var baseURL: URL {
//        // swiftlint:disable:next force_unwrapping
//        .init(string: "https://api.lp1.av5ja.srv.nintendo.net/")!
//    }
//    
//    var targetPath: String {
//        switch hash {
//        case .StageScheduleQuery:
//            return "v1/schedules"
//        case .CoopHistoryQuery:
//            return "v1/histories"
//        case .CoopHistoryDetailQuery:
//            return "v3/results"
//        case .CoopRecordQuery:
//            return "v1/records"
//        default:
//            fatalError("This query is not implemented.")
//        }
//    }
//    
//    func asURLRequest(data: Data) throws -> URLRequest {
//        // swiftlint:disable:next force_cast
//        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
//        var request = URLRequest(url: targetURL.appendingPathComponent(targetPath))
//        request.httpMethod = HTTPMethod.post.rawValue
//        request.timeoutInterval = TimeInterval(5)
//        request.headers.add(.userAgent("av5ja/\(version)"))
//        // パラメータを設定
//        let parameters: [String: Any]? = try JSONSerialization.jsonObject(with: data) as? [String: Any]
//        return try encoding.encode(request, with: parameters)
//    }
// }
