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
        List(viewModel.rows, id: \.competitionsID) { competitionViewModel in
            NavigationLink(destination: CompetitionView(viewModel: competitionViewModel)) {
                CompetitionRow(competitionName: competitionViewModel.name, competitionImageURL: competitionViewModel.competitionsLogoURL)
            }
        }
        .navigationTitle(viewModel.countryName)
        .listStyle(.plain)
        .task {
            if viewModel.rows.isEmpty {
                await viewModel.fetchCompetitionsList(country: viewModel.countryName)
                print("загружается список лиг")
            }
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionsListView(viewModel: CompetitionsListViewModel(country: Country(name: "Neverland")))
    }
}

