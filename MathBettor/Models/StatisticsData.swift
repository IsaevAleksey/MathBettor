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
