//
//  CompetitionListViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 01.05.2023.
//

import SwiftUI

class CompetitionsListViewModel: ObservableObject {
    @Published var currentCompetitionsList: [CompetitionInfo] = []
    
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
    
    @MainActor func fetchCompetitionsList() async {
        do {
            let leaguesList = try await NetworkManager.shared.fetchLeaguesList()
            self.currentCompetitionsList = leaguesList.response
        }
        catch {
            print(error)
        }
    }
}
