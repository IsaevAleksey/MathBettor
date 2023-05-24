//
//  StatisticsViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 20.05.2023.
//

import Foundation

class StatisticsViewModel: ObservableObject {
    
    var form: TeamStats {
        statisticsInfo.comparison.form
    }
    
    var att: TeamStats {
        statisticsInfo.comparison.att
    }
    
    var def: TeamStats {
        statisticsInfo.comparison.def
    }
    
    var h2h: TeamStats {
        statisticsInfo.comparison.h2h
    }
    
    var total: TeamStats {
        statisticsInfo.comparison.total
    }
    
    var poisson_distribution: TeamStats {
        statisticsInfo.comparison.poisson_distribution
    }
    
    var probabilityWinAndDraw: Percent {
        statisticsInfo.predictions.percent
    }
    
    var advice: String {
        statisticsInfo.predictions.advice
    }
    
    private let statisticsInfo: StatisticsInfo

    init(statisticsInfo: StatisticsInfo) {
        self.statisticsInfo = statisticsInfo
    } 
}
