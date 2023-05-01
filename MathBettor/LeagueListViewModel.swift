//
//  LeagueListViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 01.05.2023.
//

import SwiftUI

class LeagueListViewModel: ObservableObject {
    @Published var leaguesList: [LeagueInfo] = []
    
    
    func fetchLeaguesList() async {
        do {
            let leaguesList = try await NetworkManager.shared.fetchLeaguesList()
            self.leaguesList = leaguesList.response
        }
        catch {
            print(error)
        }
    }
}
