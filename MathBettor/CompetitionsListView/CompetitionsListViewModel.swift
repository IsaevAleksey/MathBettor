//
//  CompetitionListViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 01.05.2023.
//

import SwiftUI

class CompetitionsListViewModel {
    var currentCompetitionsList: [CompetitionInfo] {
        competitionsList.response
    }
    
    var imageData: Data {
        var imageData = Data()
        for competition in currentCompetitionsList {
            do {
                imageData = try NetworkManager.shared.fetchImage(from: competition.league.logo)
            }
            catch {
                print(error)
            }
        }
        return imageData
    }
    
    var competitionsList: CompetitionsList

    
    init(competitionsList: CompetitionsList) {
        self.competitionsList = competitionsList
    }
    
//    func fetchLeaguesList() async {
//        do {
//            let leaguesList = try await NetworkManager.shared.fetchLeaguesList()
//            self.competitionsList = leaguesList
//        }
//        catch {
//            print(error)
//        }
//    }
}
