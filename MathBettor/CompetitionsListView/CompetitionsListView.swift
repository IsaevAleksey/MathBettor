//
//  CompetitionsListView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import SwiftUI

struct CompetitionsListView: View {
    var viewModel: CompetitionsListViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.currentCompetitionsList, id: \.league.id) { competitionInfo in
                    Text (competitionInfo.league.name)
                }
            }
            .navigationTitle("Select competition")
//            .toolbar {
//                Button("StringProtocol") {
//                    Task {
//                        await viewModel.fetchLeaguesList()
//                    }
//                }
//            }
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionsListView(viewModel: CompetitionsListViewModel(competitionsList: CompetitionsList.fetchPsevdoLeaguesList()))
    }
}

