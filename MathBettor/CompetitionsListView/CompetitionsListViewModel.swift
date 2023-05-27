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
            let competitionsList = try await NetworkManager.shared.fetchCompetitionsList().response
            let sortedCompetitionsList = competitionsList.sorted(by: {$0.country.name < $1.country.name})
            rows = sortedCompetitionsList.map {CompetitionViewModel(competitionInfo: $0) }
        }
        catch {
            print(error)
        }
    }
}
