//
//  CoopEventId+String.swift
//  Thunder
//
//  Created by devonly on 2023/06/02.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

extension CoopEvent.Id: LocalizableString {
    public var description: String {
        NSLocalizedString(String(describing: self), tableName: nil, bundle: .module, comment: "")
    }
}
