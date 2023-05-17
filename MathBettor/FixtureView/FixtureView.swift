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
        
        VStack {
            HStack {
                TeamLogoImage(teamLogoURL: viewModel.homeTeamLogoURL)
                TeamLogoImage(teamLogoURL: viewModel.awayTeamLogoURL)
            }
            HStack {
                Text(viewModel.homeTeamName)
                Text(viewModel.awayTeamName)
            }
            Text(viewModel.statisticsInfo?.predictions.advice ?? "no advice")
        }
        .task {
            await viewModel.fetchStatistics(fixtureID: viewModel.fixtureID)
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
