//
//  Statistics.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import Foundation

struct StatisticsData: Decodable {
    let response: [StatisticsInfo]
}

struct StatisticsInfo: Decodable {
    let predictions: Prediction
    let comparison: Comparison
    let teams: TeamsStats // переименовать переменную саму
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

struct Comparison: Decodable {
    let form: TeamComparisonValue
    let att: TeamComparisonValue
    let def: TeamComparisonValue
    let poissonDistribution: TeamComparisonValue
    let h2h: TeamComparisonValue
    let total: TeamComparisonValue
}

struct TeamComparisonValue: Decodable {
    let home: String
    let away: String
}

struct TeamsStats: Decodable {
    let home: TeamStats
    let away: TeamStats
}

struct TeamStats: Decodable {
    let league: Stats
    
    struct Stats: Decodable {
        let fixtures: Games
        let goals: Goals
        
        struct Games: Decodable {
            let played: GameResult
            let wins: GameResult
            let draws: GameResult
            let loses: GameResult
        }
        
        struct Goals: Decodable {
            let fora: GoalsValue //  переименовать переменную
            let against: GoalsValue
            
            struct GoalsValue: Decodable {
                let total: GameResult
                let average: AverageResult
                
                struct AverageResult: Decodable {
                    let total: String
                }
            }
        }
        
        struct GameResult: Decodable {
            let total: Int
        }
    }
}
