//
//  CompetitionListViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 01.05.2023.
//

import SwiftUI

class CompetitionsListViewModel: ObservableObject {
    @Published var rows: [CompetitionViewModel] = []
    
    @MainActor func fetchCompetitionsList() async {
        do {
            let competitionsList = try await NetworkManager.shared.fetchLeaguesList().response
            rows = competitionsList.map { CompetitionViewModel(competitionInfo: $0) }
        }
        catch {
            print(error)
        }
    }
}
