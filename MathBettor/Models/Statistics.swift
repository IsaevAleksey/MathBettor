//
//  Statistics.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import Foundation

struct Statistics: Decodable {
    let response: StatisticsInfo
}

struct StatisticsInfo: Decodable {
    let predictions: Prediction
//    let teams: TeamsStats
    let comparison: Comparison
}

struct Prediction: Decodable{
    let advice: String
    let percent: Percent
}

struct Percent: Decodable {
    let home: String
    let draw: String
    let away: String
}

//struct TeamsStats: Decodable {
//    let home: TeamStats
//    let away: TeamStats
//}
//
//struct TeamStats: Decodable {
//    let last_5: LastFiveStats
//    let league: LeagueStats
//}

//struct LastFiveStats: Decodable {
//    let form: String
//    let att: String
//    let def: String
//}
//
//struct LeagueStats: Decodable {
//
//}


struct Comparison: Decodable{
    let form: TeamStats
    let att: TeamStats
    let def: TeamStats
    let poisson_distribution: TeamStats
    let h2h: TeamStats
    let total: TeamStats
}

struct TeamStats: Decodable {
    let home: String
    let away: String
}


