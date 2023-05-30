//
//  StatisticsViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 20.05.2023.
//

import Foundation

class StatisticsViewModel: ObservableObject {
    
    var form: TeamComparisonValue {
        statisticsInfo.comparison.form
    }
    
    var att: TeamComparisonValue {
        statisticsInfo.comparison.att
    }
    
    var def: TeamComparisonValue {
        statisticsInfo.comparison.def
    }
    
    var h2h: TeamComparisonValue {
        statisticsInfo.comparison.h2h
    }
    
    var total: TeamComparisonValue {
        statisticsInfo.comparison.total
    }
    
    var poissonDistribution: TeamComparisonValue {
        statisticsInfo.comparison.poissonDistribution
    }
    
    var advice: String {
        statisticsInfo.predictions.advice
    }
    
    var homePlayedMatch: Games {
        statisticsInfo.teams.home.league.fixtures
    }
    
    var awayPlayedMatch: Games {
        statisticsInfo.teams.away.league.fixtures
    }

    
    private let statisticsInfo: StatisticsInfo

    init(statisticsInfo: StatisticsInfo) {
        self.statisticsInfo = statisticsInfo
    } 
}
