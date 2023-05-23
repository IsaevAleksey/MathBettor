//
//  StatisticsViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 20.05.2023.
//

import Foundation

class StatisticsViewModel: ObservableObject {
    
    var advice: String {
        statisticsInfo.predictions.advice
    }
    
    
    private let statisticsInfo: StatisticsInfo

    init(statisticsInfo: StatisticsInfo) {
        self.statisticsInfo = statisticsInfo
    }
    
    
    
}
