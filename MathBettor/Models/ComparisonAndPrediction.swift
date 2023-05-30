//
//  ComparisonAndPrediction.swift
//  MathBettor
//
//  Created by Алексей Исаев on 30.05.2023.
//

import Foundation


struct Prediction: Decodable {
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
