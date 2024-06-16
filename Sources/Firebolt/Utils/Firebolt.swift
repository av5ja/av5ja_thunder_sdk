//
//  Firebolt.swift
//  Firebolt
//
//  Created by devonly on 2021/11/20.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation
import KeychainAccess
import Mudmouth
import UserNotifications

open class Firebolt: Session {
    private let keychain: Keychain = .init()
    internal let encoder: JSONEncoder = .init()
    internal let decoder: JSONDecoder = .init(dateDecodingStrategy: .atom)
    private var credential: UserInfo? {
        get {
            try? keychain.get()
        }
        set {
            try? keychain.set(newValue)
        }
    }
    private var authenticator: AuthenticationInterceptor<Firebolt>? {
        AuthenticationInterceptor(authenticator: self, credential: credential)
    }

    /// SplatNet3
    /// - Parameter req: <#req description#>
    /// - Returns: <#description#>
    private func fetch<T: RequestType>(_ request: T) async throws -> Data {
        let result = await self.request(request, interceptor: authenticator)
            .cURLDescription(calling: { request in
                print(request)
            })
            .serializingData(automaticallyCancelling: true)
            .response
            .result
        switch result {
        case .success(let success):
            return success
        case .failure(let failure):
            print(failure)
            throw SPError.Unauthorized
        }
    }
   
    /// Cloudflare Workers
    /// - Parameter req: <#req description#>
    /// - Returns: <#description#>
    private func dispatch<T: DispatchType>(_ request: T) async throws -> T.ResponseType {
        let data: Data = try await fetch(request)
        let result = try await self.request(request.asURLRequest(data: data))
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .response
            .result
        switch result {
        case .success(let success):
            return success
        case .failure(let failure):
            throw SPError.Unauthorized
        }
    }
    
    /// <#Description#>
    /// - Returns: <#description#>
    open func getCoopRecord() async throws -> CoopRecordQuery.Response {
        try await dispatch(CoopRecordQuery())
    }
    
    /// <#Description#>
    /// - Returns: <#description#>
    open func getWeaponRecord() async throws -> WeaponRecordQuery.Response {
        try await dispatch(WeaponRecordQuery())
    }
    
    /// <#Description#>
    /// - Returns: <#description#>
    open func getCoopHistory() async throws -> CoopHistoryQuery.Response {
        try await dispatch(CoopHistoryQuery())
    }
    
    /// <#Description#>
    /// - Parameter resultId: <#resultId description#>
    /// - Returns: <#description#>
    open func getCoopHistoryDetail(resultId: CoopHistoryDetail.Id) async throws -> Data {
        try await fetch(CoopHistoryDetailQuery(resultId: resultId))
    }
    
    /// <#Description#>
    /// - Returns: <#description#>
    open func getCoopSchedules() async throws -> CoopScheduleQuery.Response {
        try await request(CoopScheduleQuery())
            .serializingDecodable(CoopScheduleQuery.Response.self, decoder: decoder)
            .value
    }
    
    open func getCoopResults() async throws -> CoopResultQuery.Response<CoopHistoryDetailQuery.Response> {
        let histories: [CoopHistoryQuery.CoopHistory] = try await getCoopHistory().histories
        let parameters: [CoopResultQuery.CoopHistory<Data>] = try await withThrowingTaskGroup(of: CoopResultQuery.CoopHistory<Data>.self, body: { task in
            histories.forEach({ history in
                task.addTask(priority: .background, operation: { [self] in
                    CoopResultQuery.CoopHistory(schedule: history.schedule, results: try await getCoopResults(history: history))
                })
            })
            return try await task.reduce(into: [CoopResultQuery.CoopHistory<Data>](), { results, result in
                results.append(result)
            })
        })
        let result = await request(CoopResultQuery(histories: parameters))
            .serializingDecodable(CoopResultQuery.Response<CoopHistoryDetailQuery.Response>.self, decoder: decoder)
            .response
            .result
        switch result {
        case .success(let success):
            return success
        case .failure(let failure):
            print(failure)
            throw SPError.EncodingFailed
        }
    }

    func getCoopResults(history: CoopHistoryQuery.CoopHistory) async throws -> [Data] {
        try await withThrowingTaskGroup(of: Data.self, body: { task in
            history.results.forEach({ resultId in
                task.addTask(priority: .background, operation: { [self] in
                    try await getCoopHistoryDetail(resultId: resultId)
                })
            })
            return try await task.reduce(into: [Data](), { results, result in
                results.append(result)
            })
        })
    }
    
    public static func configure(response: UNNotificationResponse) -> Bool {
        // Keychainに保存しておけばどこからでも呼び出せるので
        let keychain: Keychain = .init()
        
        if let bulletToken: String = response.bulletToken,
           let gameWebToken: String = response.gameWebToken,
           let version: String = response.version,
           let userAgent: String = response.userAgent {
            let userinfo: UserInfo = .init(
                bulletToken: bulletToken,
                gameWebToken: gameWebToken,
                version: version,
                userAgent: userAgent
            )
            try? keychain.set(userinfo)
            return true
        }
        return false
    }
}

extension Firebolt: Authenticator {
    public func apply(_ credential: UserInfo, to urlRequest: inout URLRequest) {
        print(credential.gameWebToken.rawValue)
        #if targetEnvironment(simulator)
        urlRequest.headers.add(.authorization(bearerToken: SecretKeys.bulletToken))
        urlRequest.headers.add(.userAgent(SecretKeys.userAgent))
        urlRequest.headers.add(name: "X-Web-View-Ver", value: SecretKeys.xWebViewVer)
        #else
        urlRequest.headers.add(.authorization(bearerToken: credential.bulletToken.token))
        urlRequest.headers.add(.userAgent(credential.userAgent))
        urlRequest.headers.add(name: "X-Web-View-Ver", value: credential.version)
        #endif
    }
    
    public func refresh(_ credential: UserInfo, for session: Session, completion: @escaping (Result<Credential, any Error>) -> Void) {
        completion(.failure(SPError.Unauthorized))
    }
    
    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: any Error) -> Bool {
        response.statusCode == 401
    }
    
    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: UserInfo) -> Bool {
        true
    }
}
