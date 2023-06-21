//
//  FixtureViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 11.05.2023.
//

import SwiftUI

class FixtureViewModel: ObservableObject {
    @Published var comparisonViewModel: [ComparisonViewModel] = []
    @Published var statisticsViewModel: [StatisticsViewModel] = []
    @Published var predictionTabViewModel: [PredictionViewModel] = []
    
    var fixtureID: Int {
        fixtureInfo.fixture.id
    }
    
    var fixtureDate: String {
        fixtureInfo.fixture.date
    }
    
    var homeTeamName: String {
        fixtureInfo.teams.home.name
    }
    
    var awayTeamName: String {
        fixtureInfo.teams.away.name
    }
    
    var homeTeamLogoURL: String {
        fixtureInfo.teams.home.logo
    }
    
    var awayTeamLogoURL: String {
        fixtureInfo.teams.away.logo
    }
    
    private let fixtureInfo: FixtureInfo

    init(fixtureInfo: FixtureInfo) {
        self.fixtureInfo = fixtureInfo
    }
    
    
    @MainActor func fetchStatistics(fixtureID: Int) async {
        do {
            let statisticsInfo = try await NetworkManager.shared.fetchStatistics(fixtureID: fixtureID).response
            comparisonViewModel = statisticsInfo.map { ComparisonViewModel(statisticsInfo: $0, id: UUID()) }
            statisticsViewModel = statisticsInfo.map { StatisticsViewModel(teamsStats: $0.teams) }
            predictionTabViewModel = statisticsInfo.map { PredictionViewModel(statisticsInfo: $0) }
        }
        catch {
            print(error)
        }
    }
}



