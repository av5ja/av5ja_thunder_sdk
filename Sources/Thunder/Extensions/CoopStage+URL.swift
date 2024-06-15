//
//  CoopStage+URL.swift
//  Thunder
//
//  Created by tkgstrator on 2024/05/05.
//  Copyright @ 2024 Magi, Corporation. All rights reserved.
//
//  Generated automatically by SplatNet3Gen, do not edit.
//

import Foundation

extension CoopStage.Key: URLConvertible {
    public var path: String {
        "resources/prod/v2/stage_img/icon/high_resolution/"
    }
}


extension CoopStage.Id: URLConvertible {
    public var path: String {
        "resources/prod/v2/stage_img/icon/high_resolution/"
    }
    
    public var assetURL: URL?  {
        guard let index: Int = Self.allCases.firstIndex(of: self) else {
            return nil
        }
        return CoopStage.Key.allCases[index].assetURL
    }
}
