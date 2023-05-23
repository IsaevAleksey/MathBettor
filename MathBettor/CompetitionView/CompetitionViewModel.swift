//
//  CompetitionViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import SwiftUI

class CompetitionViewModel: ObservableObject {
    
    @Published var rows: [FixtureViewModel] = []
    
    let fromDate = Date()
    
    var toDate: Date {
        let toDate = Date() + 60*60*24*15
        return toDate
    }

    var name: String {
        competitionInfo.league.name
    }
    
    var competitionsID: Int {
        competitionInfo.league.id
    }
    
    var competitionsLogoURL: String {
        competitionInfo.league.logo
    }

    var competitionCountry: String {
        competitionInfo.country.name
    }
    
    var currentSeason: Season {
        let currentSeason: Season
        let sortedSeasons = competitionInfo.seasons.sorted(by: {$0.year < $1.year})
        let trueSeason = sortedSeasons.filter {$0.current == true}
        if trueSeason.isEmpty {
            currentSeason = sortedSeasons.last!
        } else {
            currentSeason = trueSeason[0]
        }
        return currentSeason
    }
    
    private let competitionInfo: CompetitionInfo

    init(competitionInfo: CompetitionInfo) {
        self.competitionInfo = competitionInfo
    }
    
    @MainActor func fetchFixturesList(leagueID: Int, currentSeason: Int, fromDate: String, toDate: String) async {
        do {
            let fixturesList = try await NetworkManager.shared.fetchFixturesList(leagueID: leagueID, currentSeason: currentSeason, fromDate: fromDate, toDate: toDate).response
            rows = fixturesList.map { FixtureViewModel(fixtureInfo: $0) }
        }
        catch {
            print(error)
        }
    }
    


    
//    func fetchFixturesList1() {
//        NetworkManager.shared.fetchResponse(FixturesList.self) { [weak self] result in
//            switch result {
//            case .success(let fixturesList):
//                self?.rows = fixturesList.response
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
}

extension Date {
    var toApiString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
