//
//  CompetitionInfo.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import Foundation

struct CompetitionsList: Decodable {
    var response: [CompetitionInfo]
    
//    mutating func fetchLeaguesList() async -> CompetitionsList {
//        do {
//            let competitionsList = try await NetworkManager.shared.fetchLeaguesList()
//            self.response = competitionsList.response
//        }
//        catch {
//            print(error)
//        }
//    }
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
    let flag: String?
}

struct Season: Decodable {
    let year: Int
    let current: Bool
}

extension CompetitionsList {
    static func fetchPsevdoLeaguesList() -> CompetitionsList {
        CompetitionsList(response: [CompetitionInfo(league: League(id: 1, name: "liga", logo: "logo"), country: Country(name: "strana", flag: "flag"), seasons: [Season(year: 2001, current: true)])])
    }
}



