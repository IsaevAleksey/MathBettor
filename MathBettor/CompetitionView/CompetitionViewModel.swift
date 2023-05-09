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

    var competitionCountry: String {
        competitionInfo.country.name
    }
    
//    var fixturesList: FixturesList {
//
//    }
    
    private let competitionInfo: CompetitionInfo

    init(competitionInfo: CompetitionInfo) {
        self.competitionInfo = competitionInfo
    }
}
