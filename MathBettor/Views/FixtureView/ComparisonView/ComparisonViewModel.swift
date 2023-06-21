//
//  StatisticsViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 20.05.2023.
//

import Foundation

class ComparisonViewModel: ObservableObject {
    
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
    
//    var advice: String {
//        statisticsInfo.predictions.advice
//    }
    
    let id: UUID
    
    private let statisticsInfo: StatisticsInfo

    init(statisticsInfo: StatisticsInfo, id: UUID) {
        self.statisticsInfo = statisticsInfo
        self.id = id
    } 
}
