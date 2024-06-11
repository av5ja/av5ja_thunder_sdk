//
//  Refreshable.swift
//  Firebolt
//
//  Created by devonly on 2021/11/20.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI

public extension View {
    @available(iOS 15.0, *)
    @MainActor
    @ViewBuilder
    func refreshable(action: @escaping @Sendable () async throws -> Void) -> some View {
        refreshable(action: {
            do {
                try await action()
            } catch {
                print(error)
            }
        })
    }
}
