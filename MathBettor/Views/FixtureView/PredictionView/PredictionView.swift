//
//  PredictionTabView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 25.05.2023.
//

import SwiftUI

struct PredictionView: View {
    @StateObject var viewModel: PredictionViewModel
    private let column = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            Text("PREDICTION")
                .bold()
                .padding(.bottom)
            HStack(spacing: 30.0) {
                VStack {
                    Text("WIN HOME")
                    CircularProgressBarView(value: viewModel.probabilityWinAndDraw.home)
                }
                VStack {
                    Text("DRAW")
                    CircularProgressBarView(value: viewModel.probabilityWinAndDraw.draw)
                }
                VStack {
                    Text("WIN AWAY")
                    CircularProgressBarView(value: viewModel.probabilityWinAndDraw.away)
                }
            }
            Text("Advice: \(viewModel.advice)")
                .bold()
                .multilineTextAlignment(.center)
                .frame(height: 50)
                .padding(.top, 50.0)
            
            Text("*  -1.5 means that there will be a maximum of 1.5 goals in the fixture, i.e : 1 goal")
                .fontWeight(.thin)
                .multilineTextAlignment(.center)
                .padding(.vertical)
            Text("SCORE PROBABILITY")
                .bold()
            LazyVGrid(columns: column) {
                ForEach(viewModel.prob.sorted(by: { $0.key < $1.key }), id: \.key) {
                    (score, probability) in
                    GridItemView(score: score, probability: probability)
                }
            }
        }
    }
}



struct PredictionTabView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionView(viewModel: PredictionViewModel(statisticsInfo: StatisticsInfo(predictions: Prediction(advice: "adviceadviceadviceadviceadviceadviceadvice", percent: Percent(home: "20%", draw: "30%", away: "50%")), comparison: Comparison(form: TeamComparisonValue(home: "20", away: "10"), att: TeamComparisonValue(home: "30", away: "45"), def: TeamComparisonValue(home: "30", away: "60"), poissonDistribution: TeamComparisonValue(home: "25", away: "70"), h2h: TeamComparisonValue(home: "30", away: "40"), total: TeamComparisonValue(home: "50", away: "70")), teams: TeamsStats(home: TeamStats(id: 55, league: Stats(fixtures: Games(played: Value(total: 5), wins: Value(total: 5), draws: Value(total: 4), loses: Value(total: 2)), goals: Goals(scored: GoalsValue(total: Value(total: 40), average: AverageValue(total: "5.4")), сonceded: GoalsValue(total: Value(total: 20), average: AverageValue(total: "1.5"))))), away: TeamStats(id: 55, league: Stats(fixtures: Games(played: Value(total: 5), wins: Value(total: 6), draws: Value(total: 3), loses: Value(total: 3)), goals: Goals(scored: GoalsValue(total: Value(total: 25), average: AverageValue(total: "1.1")), сonceded: GoalsValue(total: Value(total: 41), average: AverageValue(total: "3.6")))))))))
    }
}
