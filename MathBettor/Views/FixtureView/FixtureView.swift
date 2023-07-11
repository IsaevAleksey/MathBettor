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
        GeometryReader { geometry in
            VStack {
                FixtureInfoView(
                    homeTeamLogoURL: viewModel.homeTeamLogoURL,
                    awayTeamLogoURL: viewModel.awayTeamLogoURL,
                    homeTeamName: viewModel.homeTeamName,
                    awayTeamName: viewModel.awayTeamName,
                    fixtureDate: viewModel.fixtureDate)
                        .frame(height: geometry.size.height / 3)
                        .task {
                            if viewModel.comparisonViewModel.isEmpty {
                                await viewModel.fetchStatistics(fixtureID: viewModel.fixtureID)
                                print("загражуем прогноз")
                                }
                            }
                if viewModel.comparisonViewModel.isEmpty {
                    ProgressView()
                        .padding(100)
                    } else {
                        TabView {
                            List(viewModel.comparisonViewModel, id: \.id) { comparisonViewModel in
                                ComparisonView(viewModel: comparisonViewModel)
                            }
                            .listStyle(.inset)
                            .tabItem {
                                Image(systemName: "chart.xyaxis.line")
                                Text("Comparison")
                                }
                            List(viewModel.statisticsViewModel, id: \.homeTeamId) {statisticsViewModel in
                                StatisticsView(viewModel: statisticsViewModel)
                            }
                            .listStyle(.inset)
                            .tabItem {
                                Image(systemName: "sportscourt")
                                Text("Statistics")
                                }
                            List(viewModel.predictionTabViewModel, id: \.advice) { predictionViewModel in
                                PredictionView(viewModel: predictionViewModel)
                            }
                            .listStyle(.inset)
                            .tabItem {
                                Image(systemName: "percent")
                                Text("Prediction")
                                }
                            }
                            .accentColor(Color("TabBarColor"))
                        }
            }
            .ignoresSafeArea()
        }
    }
}

struct FixtureView_Previews: PreviewProvider {
    static var previews: some View {
        FixtureView(viewModel: FixtureViewModel(fixtureInfo: FixtureInfo.fetchPsevdoFixtureInfo()))
    }
}
