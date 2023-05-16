//
//  FixtureViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 11.05.2023.
//

import SwiftUI

class FixtureViewModel {
    
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
    private let statisticsInfo: StatisticsInfo

    init(fixtureInfo: FixtureInfo, statisticsInfo: StatisticsInfo) {
        self.fixtureInfo = fixtureInfo
        self.statisticsInfo = statisticsInfo
    }
    
    func fetchStatistics(fixtureID: Int) async {
        do {
            let statistics = try await NetworkManager.shared.fetchStatistics(fixtureID: fixtureID).response
        }
        catch {
            print(error)
        }
    }
}

