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
            List(viewModel.rows, id: \.competitionsId) { competitionViewModel in
                Section(header: Text(competitionViewModel.competitionCountry)) {
                    NavigationLink(destination: CompetitionView(viewModel: competitionViewModel)) {
                        CompetitionRow(competitionName: competitionViewModel.competitionName, competitionImageURL: competitionViewModel.competitionsLogoUrl)
                    }
                }
            }
            .navigationTitle("Select competition")
            .listStyle(.plain)
        }
        .task {
            if viewModel.rows.isEmpty {
                await viewModel.fetchCompetitionsList()
                print("загражается список лиг")
            }
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionsListView(viewModel: CompetitionsListViewModel())
    }
}

