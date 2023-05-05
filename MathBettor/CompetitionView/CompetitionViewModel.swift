//
//  CompetitionViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import SwiftUI

class CompetitionViewModel {

    var name: String {
        competitionInfo.league.name
    }
    
    var competitionsID: Int {
        competitionInfo.league.id
    }
    
    var competitionsLogo: String {
        competitionInfo.league.logo
    }
    
    var imageData: Data {
        get async {
            var imageData = Data()
                do {
                    imageData = try await NetworkManager.shared.fetchImage(from: competitionsLogo)
                }
                catch {
                    print(error)
                }
            return imageData
        }
    }

//    var fixturesList: FixturesList {
//
//    }
    
    private let competitionInfo: CompetitionInfo

    init(competitionInfo: CompetitionInfo) {
        self.competitionInfo = competitionInfo
    }
}
