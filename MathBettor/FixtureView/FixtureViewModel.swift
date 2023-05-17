//
//  FixtureViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 11.05.2023.
//

import SwiftUI

class FixtureViewModel: ObservableObject {
    
    var statisticsInfo: StatisticsInfo?
    
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
    
    func fetchStatistics(fixtureID: Int) async {
        do {
            statisticsInfo = try await NetworkManager.shared.fetchStatistics(fixtureID: fixtureID).response
        }
        catch {
            print(error)
        }
    }
}

