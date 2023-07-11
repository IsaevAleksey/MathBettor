//
//  PredictionTabViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 25.05.2023.
//

import Foundation

class PredictionViewModel: ObservableObject {
        
    var probabilityWinAndDraw: Percent {
        statisticsInfo.predictions.percent
    }
    
    var advice: String {
        statisticsInfo.predictions.advice
    }
    
    //MARK: property for calculation of probabilities
    var prob: [String: Double] {
        fetchScoreProbabilities()
    }
    
    private var homePlayedGames: Int {
        statisticsInfo.teams.home.league.fixtures.played.total
    }
    
    private var awayPlayedGames: Int {
        statisticsInfo.teams.away.league.fixtures.played.total
    }
    
    private var homeGoalsScored: Double {
        NSString(string: statisticsInfo.teams.home.league.goals.scored.average.total).doubleValue
    }
    
    private var awayGoalsScored: Double {
        NSString(string: statisticsInfo.teams.away.league.goals.scored.average.total).doubleValue
    }
    
    private var homeGoalsConceded: Double {
        NSString(string: statisticsInfo.teams.home.league.goals.сonceded.average.total).doubleValue
    }
    
    private var awayGoalsConceded: Double {
        NSString(string: statisticsInfo.teams.away.league.goals.сonceded.average.total).doubleValue
    }
    
    private var homeForm: Double {
        NSString(string: statisticsInfo.comparison.form.home).doubleValue
    }
    
    private var awayForm: Double {
        NSString(string: statisticsInfo.comparison.form.away).doubleValue
    }
    
    //MARK: init
    private let statisticsInfo: StatisticsInfo

    init(statisticsInfo: StatisticsInfo) {
        self.statisticsInfo = statisticsInfo
    }
    
    // MARK: calculation of probabilities
    private func teamGoalExpectancy(
        averageGoalsScored: Double,
        averageGoalsConceded: Double,
        firstTeamForm: Double,
        opponentTeamForm: Double
        ) -> Double {
            
        let teamFormFactor = firstTeamForm / 100
//        let opponentFormFactor = opponentTeamForm / 100
        
        let expectancy = averageGoalsScored * averageGoalsConceded * teamFormFactor // * opponentFormFactor
        return expectancy
    }
    
    func fetchScoreProbabilities() -> [String: Double] {
        var probabilities: [String: Double] = [:]
        
        for i in 0...5 {
            for j in 0...5 {
                let probability = poissonProbability(for: i, and: j)
                let key = "\(i)-\(j)"
                probabilities[key] = probability
            }
        }
        return probabilities
    }
    
    private func poissonProbability(for homeGoals: Int, and awayGoals: Int) -> Double {
        let lambdaHome = teamGoalExpectancy(
            averageGoalsScored: homeGoalsScored,
            averageGoalsConceded: awayGoalsConceded,
            firstTeamForm: homeForm,
            opponentTeamForm: awayForm
        )
        let lambdaAway = teamGoalExpectancy(
            averageGoalsScored: awayGoalsScored,
            averageGoalsConceded: homeGoalsConceded,
            firstTeamForm: awayForm,
            opponentTeamForm: homeForm
        )
        
        let probHome = exp(-lambdaHome) * pow(lambdaHome, Double(homeGoals)) / factorial(homeGoals)
        let probAway = exp(-lambdaAway) * pow(lambdaAway, Double(awayGoals)) / factorial(awayGoals)
        
        return probHome * probAway * 100
    }
    
    private func factorial(_ n: Int) -> Double {
        if n == 0 {
            return 1
        } else {
            return Double(n) * factorial(n - 1)
        }
    }
}
