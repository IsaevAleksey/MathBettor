//
//  StatisticsViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 31.05.2023.
//

import Foundation

class StatisticsViewModel: ObservableObject {

    var homeTeamId: Int {
        teamsStats.home.id
    }
    
    var homePlayedMatch: Games {
        teamsStats.home.league.fixtures
    }
    
    var awayPlayedMatch: Games {
        teamsStats.away.league.fixtures
    }
    
    var homeGoalsScored: GoalsValue {
        teamsStats.home.league.goals.scored
    }
    
    var awayGoalsScored: GoalsValue {
        teamsStats.away.league.goals.scored
    }
    
    var homeGoalsAgainst: GoalsValue {
        teamsStats.home.league.goals.against
    }
    
    var awayGoalsAgainst: GoalsValue {
        teamsStats.away.league.goals.against
    }
    
    private let teamsStats: TeamsStats

    init(teamsStats: TeamsStats) {
        self.teamsStats = teamsStats
    }
}
