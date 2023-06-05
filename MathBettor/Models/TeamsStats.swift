//
//  TeamsStats.swift
//  MathBettor
//
//  Created by Алексей Исаев on 29.05.2023.
//

import Foundation

struct TeamsStats: Decodable {
    let home: TeamStats
    let away: TeamStats
}

struct TeamStats: Decodable {
    let id: Int
    let league: Stats
}
    
struct Stats: Decodable {
    let fixtures: Games
    let goals: Goals
}
        
struct Games: Decodable {
    let played: Value
    let wins: Value
    let draws: Value
    let loses: Value
}
        
struct Goals: Decodable {
    let scored: GoalsValue
    let сonceded: GoalsValue
    
    enum CodingKeys: String, CodingKey {
        case scored = "for"
        case сonceded = "against"
    }
}
            
struct GoalsValue: Decodable {
    let total: Value
    let average: AverageValue
}
                
struct AverageValue: Decodable {
    let total: String
}
        
struct Value: Decodable {
    let total: Int
}
