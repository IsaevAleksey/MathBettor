//
//  CompetitionsListView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import SwiftUI

struct CompetitionsListView: View {
    @StateObject var viewModel: CompetitionsListViewModel
    @State private var searchText = ""
    
    var searchResults: [CompetitionViewModel] {
        if searchText.isEmpty {
            return viewModel.rows
        } else {
            return viewModel.rows.filter { $0.competitionCountry.contains(searchText) }
        }
    }
    
    var body: some View {
        if viewModel.rows.isEmpty {
            VStack(spacing: 20.0) {
                ProgressView()
                Text("Download...")
            }
            .task {
                await viewModel.fetchCompetitionsList()
                print("загружается список лиг")
            }
        } else {
            NavigationView {
                ZStack {
                    Color("NavigationViewBackground")
                        .ignoresSafeArea()
                    List(searchResults, id: \.competitionsId) { competitionViewModel in
                        NavigationLink(destination: CompetitionView(viewModel: competitionViewModel)) {
                            CompetitionRow(
                                competitionName: competitionViewModel.competitionName,
                                competitionCountry: competitionViewModel.competitionCountry,
                                competitionImageURL: competitionViewModel.competitionsLogoUrl
                            )
                        }
                    }
                    .navigationTitle("Select competition")
                    .toolbarBackground(Color("NavigationViewBackground"), for: .navigationBar)
                    .listStyle(.plain)
                }
            }
            .preferredColorScheme(.light)
            .accentColor(.white)
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "search by country"
                )
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
            CompetitionsListView(viewModel: CompetitionsListViewModel())
    }
}
