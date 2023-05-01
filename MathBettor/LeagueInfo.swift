//
//  LeagueInfo.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import Foundation

struct LeaguesList: Decodable {
    var response: [LeagueInfo] = []
    
    mutating func fetchLeaguesList() async {
        do {
            let leaguesList = try await NetworkManager.shared.fetchLeaguesList()
            self.response = leaguesList.response
        }
        catch {
            print(error)
        }
    }
}

struct LeagueInfo: Decodable {
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
    let flag: String
}

struct Season: Decodable {
    let year: Int
    let current: Bool
}




