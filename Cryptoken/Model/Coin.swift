//
//  Coin.swift
//  Cryptoken
//
//  Created by Kürşat Şimşek on 19.11.2021.
//

import Foundation

struct RequestModel: Codable {
    var status : String = ""
    var data : DataModel
}

struct DataModel:Codable {
    var stats : Stats
    var coins : [Coin]
}

struct Stats: Codable {
    var total = 12616
    var totalCoins = 12616
}

struct Coin:Codable {
    var uuid : String = ""
    var symbol : String = ""
    var name : String = ""
    var color : String = ""
    var iconUrl : String = ""
}
