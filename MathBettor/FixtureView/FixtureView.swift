//
//  FixtureView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 11.05.2023.
//

import SwiftUI

struct FixtureView: View {
//    @EnvironmentObject var statisticsInfo: FixtureViewModel
    
    @StateObject var viewModel: FixtureViewModel
    
    var body: some View {
        
        VStack(spacing: 16.0) {
            HStack(spacing: 100.0) {
                VStack {
                    TeamLogoImage(teamLogoURL: viewModel.homeTeamLogoURL)
                        .frame(height: 50)
                    Text(viewModel.homeTeamName)
                }
                VStack {
                    TeamLogoImage(teamLogoURL: viewModel.awayTeamLogoURL)
                        .frame(height: 50)
                    Text(viewModel.awayTeamName)
                }
            }
            Text(viewModel.fixtureDate)
//            Text(viewModel.currendDate.toApiString)
//            Text(viewModel.toDate.toApiString)

            List(viewModel.statisticsViewModel, id: \.advice) { statisticsViewModel in
                StatisticsView(viewModel: statisticsViewModel)
                }
//            Text(viewModel.statisticsInfo?.predictions.advice ?? "no advice")
        }
        .task {
            if viewModel.statisticsViewModel.isEmpty {
                await viewModel.fetchStatistics(fixtureID: viewModel.fixtureID)
                print("загражаем прогноз")
            }
        }
    }
}

struct FixtureView_Previews: PreviewProvider {
    static var previews: some View {
        FixtureView(viewModel: FixtureViewModel(fixtureInfo: FixtureInfo.fetchPsevdoFixtureInfo()
//                                                , statisticsInfo: StatisticsInfo(predictions: Prediction(advice: "sovet", percent: Percent(home: "30", draw: "20", away: "50")), comparison: Comparison(form: TeamStats(home: "team1", away: "team2"), att: TeamStats(home: "team1", away: "team2"), def: TeamStats(home: "team1", away: "team2"), poisson_distribution: TeamStats(home: "team1", away: "team2"), h2h: TeamStats(home: "team1", away: "team2"), total: TeamStats(home: "team1", away: "team2")))
                                               ))
    }
}
