//
//  CompetitionViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import SwiftUI

class CompetitionViewModel {
    var currentCompetitionsList: [CompetitionInfo] {
        competitionsList.response
    }
    
    var imageData: Data {
        var imageData = Data()
            do {
                imageData = try NetworkManager.shared.fetchImage(from: currentCompetitionsList[0].league.logo)
            }
            catch {
                print(error)
            }
        return imageData
    }
    
//    var fixturesList: FixturesList {
//
//    }
    
    private let competitionsList: CompetitionsList

    
    init(competitionsList: CompetitionsList) {
        self.competitionsList = competitionsList
    }
}
