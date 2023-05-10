//
//  CompetitionsListView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import SwiftUI

struct CompetitionsListView: View {
    @StateObject var viewModel: CompetitionsListViewModel
    var body: some View {
        NavigationView {
            List(viewModel.rows, id: \.competitionsID) { competitionViewModel in
                    NavigationLink(destination: CompetitionView(viewModel: competitionViewModel)) {
                    CompetitionRow(competitionName: competitionViewModel.name, competitionImageURL: competitionViewModel.competitionsLogo)
                    }
                }
                .navigationTitle("Select competition")
        }
        .onAppear {
            Task {
                await viewModel.fetchCompetitionsList()
            }
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionsListView(viewModel: CompetitionsListViewModel())
    }
}

