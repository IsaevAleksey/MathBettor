//
//  LeagueModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import Foundation

struct LeagueList: Decodable {
    let response: [LeagueModel]
}

struct LeagueModel: Decodable {
    let league: League
    let country: Country
    let seasons: [Season]
}

struct League: Decodable {
    let id: Int?
    let name: String?
    let logo: String?
}

struct Country: Decodable {
    let name: String?
    let flag: String?
}

struct Season: Decodable {
    let year: Int?
    let current: Bool
}
