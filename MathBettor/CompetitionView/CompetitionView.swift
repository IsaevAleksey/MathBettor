//
//  CompetitionView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import SwiftUI

struct CompetitionView: View {
    @StateObject var viewModel: CompetitionViewModel
    var body: some View {
        VStack {
            CompetitionImage(imageURL: viewModel.competitionsLogoURL, imageSize: CGSize(width: 100, height: 100), cornerRadius: 10, shadowIsOn: true)
            Text(viewModel.competitionCountry)
            Text(viewModel.name)
                .font(.largeTitle)
//            Spacer()
            List(viewModel.rows, id: \.fixtureID) { fixtureViewModel in
                Section(header: Text(fixtureViewModel.fixtureDate)) {
                    NavigationLink(destination: FixtureView(viewModel: fixtureViewModel)) {
                        FixtureRow(homeTeamLogoURL: fixtureViewModel.homeTeamLogoURL, awayTeamLogoURL: fixtureViewModel.awayTeamLogoURL, homeTeamName: fixtureViewModel.homeTeamName, awayTeamName: fixtureViewModel.awayTeamName)
                    }
                }
            }
            .listStyle(.automatic)
        }
        .task {
            await viewModel.fetchFixturesList(leagueID: viewModel.competitionsID, currentSeason: viewModel.currentSeason.year)
        }
    }
}

struct CompetitionView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionView(viewModel: CompetitionViewModel(competitionInfo: CompetitionInfo.fetchPsevdoCompetitionInfo()))
    }
}
