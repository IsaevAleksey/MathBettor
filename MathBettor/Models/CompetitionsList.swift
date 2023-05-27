//
//  CompetitionsList.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import Foundation

struct CompetitionsList: Decodable {
    let response: [CompetitionInfo]
}

struct CompetitionInfo: Decodable {
    let league: League
    let country: Country
    let seasons: [Season]
}

struct League: Decodable {
    let id: Int
    let name: String
    let logo: String
}

struct Country: Decodable {
    let name: String
}

struct Season: Decodable {
    let year: Int
    let current: Bool
}


    // убрать
extension CompetitionsList {
    static func fetchPsevdoLeaguesList() -> CompetitionsList {
        CompetitionsList(response: [CompetitionInfo(league: League(id: 1, name: "liga", logo: "logo"), country: Country(name: "strana"), seasons: [Season(year: 2001, current: true)])])
    }
}

extension CompetitionInfo {
    static func fetchPsevdoCompetitionInfo() -> CompetitionInfo {
        CompetitionInfo(league: League(id: 1, name: "liga1", logo: "logo1"), country: Country(name: "Strana1"), seasons: [Season(year: 2022, current: true)])
    }
}


