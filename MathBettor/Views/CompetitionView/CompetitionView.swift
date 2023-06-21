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
        GeometryReader { geometry in
            VStack {
                CompetitionInfoView(imageURL: viewModel.competitionsLogoUrl, competitionCountry: viewModel.competitionCountry, competitionName: viewModel.competitionName)
                    .frame(height: geometry.size.height / 3)
                if viewModel.rows.isEmpty {
                    Text ("There are no upcoming games for the next 7 days")
                        .multilineTextAlignment(.center)
                        .padding(.top, 200.0)
                    Spacer()
                } else {
                    List(viewModel.rows, id: \.fixtureID) { fixtureViewModel in
                        Section(header: Text(fixtureViewModel.fixtureDate)) {
                            NavigationLink(destination: FixtureView(viewModel: fixtureViewModel)) {
                                FixtureRow(
                                    homeTeamLogoURL: fixtureViewModel.homeTeamLogoURL,
                                    awayTeamLogoURL: fixtureViewModel.awayTeamLogoURL,
                                    homeTeamName: fixtureViewModel.homeTeamName,
                                    awayTeamName: fixtureViewModel.awayTeamName
                                )
                            }
                        }
                    }
                    .listStyle(.automatic)
                }
            }
            .background(Color(.systemGroupedBackground))
            .task {
                if viewModel.rows.isEmpty {
                    await viewModel.fetchFixturesList(leagueID: viewModel.competitionsId, currentSeason: viewModel.currentSeason.year, fromDate: viewModel.fromDate.toApiString, toDate: viewModel.toDate.toApiString)
                    print("список игр загружается")
                }
            }
        }
    }
}

struct CompetitionView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionView(viewModel: CompetitionViewModel(competitionInfo: CompetitionInfo.fetchPsevdoCompetitionInfo()))
    }
}
