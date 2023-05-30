//
//  FixtureView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 11.05.2023.
//

import SwiftUI

struct FixtureView: View {
    @StateObject var viewModel: FixtureViewModel
    
    var body: some View {
        VStack(spacing: 16.0) {
            HStack(alignment: .top, spacing: 100.0) {
                VStack {
                    TeamLogoImage(teamLogoURL: viewModel.homeTeamLogoURL)
                        .frame(height: 50)
                    Text(viewModel.homeTeamName)
                        .multilineTextAlignment(.center)
                }
                VStack {
                    TeamLogoImage(teamLogoURL: viewModel.awayTeamLogoURL)
                        .frame(height: 50)
                    Text(viewModel.awayTeamName)
                }
            }
            Text(viewModel.fixtureDate)
                .padding(.bottom)
//            Text(viewModel.currendDate.toApiString)
//            Text(viewModel.toDate.toApiString)
            TabView {
                List(viewModel.statisticsViewModel, id: \.advice) { statisticsViewModel in
                    StatisticsView(viewModel: statisticsViewModel)
                }
                    .listStyle(.inset)
                    .tabItem {
                        Image(systemName: "chart.xyaxis.line")
                        Text("Statistics")
                    }
                List(viewModel.predictionTabViewModel, id: \.advice) { predictionTabViewModel in
                    PredictionTabView(viewModel: predictionTabViewModel)
                }
                    .listStyle(.inset)
                    .tabItem {
                        Image(systemName: "percent")
                        Text("Prediction")
                    }
                ScorePredictionTabView()
                    .tabItem {
                        Image(systemName: "soccerball")
                        Text("Score Prediction")
                    }
            }
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
        FixtureView(viewModel: FixtureViewModel(fixtureInfo: FixtureInfo.fetchPsevdoFixtureInfo()))
    }
}
