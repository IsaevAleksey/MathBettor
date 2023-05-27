//
//  CompetitionListViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 01.05.2023.
//

import SwiftUI

class CompetitionsListViewModel: ObservableObject {
    @Published var rows: [CompetitionViewModel] = []
    
    var countryName: String {
        country.name
    }
    
    private let country: Country

    init(country: Country) {
        self.country = country
    }
    
    @MainActor func fetchCompetitionsList(country: String) async {
        do {
            let competitionsList = try await NetworkManager.shared.fetchCompetitionsList(country: country).response
            let sortedCompetitionsList = competitionsList.sorted(by: {$0.league.id < $1.league.id})
            rows = sortedCompetitionsList.map {CompetitionViewModel(competitionInfo: $0) }
        }
        catch {
            print(error)
        }
    }
}
