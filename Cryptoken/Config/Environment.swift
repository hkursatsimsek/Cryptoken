//
//  Environment.swift
//  Cryptoken
//
//  Created by Kürşat Şimşek on 20.11.2021.
//

import Foundation

private enum Consts {
    static let baseUrl = "https://api.coinranking.com/v2/coins"
}

enum Environment {
    static func baseUrl() -> URL {
        return URL(string: Consts.baseUrl)!
    }
}
