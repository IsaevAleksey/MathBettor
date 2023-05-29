//
//  StatisticsView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 20.05.2023.
//

import SwiftUI

struct StatisticsView: View {
    @StateObject var viewModel: StatisticsViewModel
    
    var body: some View {
        VStack {
            Text("COMPARISON")
                .bold()
                .padding(.bottom)
            StatisticsRowView(parametr: "FORM", homeTeamParametrValue: viewModel.form.home, awayTeamParametrValue: viewModel.form.away)
            StatisticsRowView(parametr: "ATT", homeTeamParametrValue: viewModel.att.home, awayTeamParametrValue: viewModel.att.away)
            StatisticsRowView(parametr: "DEF", homeTeamParametrValue: viewModel.def.home, awayTeamParametrValue: viewModel.def.away)
            StatisticsRowView(parametr: "H2H", homeTeamParametrValue: viewModel.h2h.home, awayTeamParametrValue: viewModel.h2h.away)
            StatisticsRowView(parametr: "TOTAL", homeTeamParametrValue: viewModel.total.home, awayTeamParametrValue: viewModel.total.away)
            StatisticsRowView(parametr: "POISSON DISTRIBUTION", homeTeamParametrValue: viewModel.poissonDistribution.home, awayTeamParametrValue: viewModel.poissonDistribution.away)
            Text("STATISTICS")
                .bold()
                .padding(.vertical)
            StatisticsRowView(parametr: "GAMES", homeTeamParametrValue: "\(viewModel.homePlayedMatch)", awayTeamParametrValue: "\(viewModel.awayPlayedMatch)")
        }
    }
}

struct SratisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(viewModel: StatisticsViewModel(statisticsInfo: StatisticsInfo(predictions: Prediction(advice: "advice", percent: Percent(home: "20%", draw: "30%", away: "50%")), comparison: Comparison(form: TeamComparisonValue(home: "20", away: "10"), att: TeamComparisonValue(home: "30", away: "45"), def: TeamComparisonValue(home: "30", away: "60"), poissonDistribution: TeamComparisonValue(home: "25", away: "70"), h2h: TeamComparisonValue(home: "30", away: "40"), total: TeamComparisonValue(home: "50", away: "70")), teams: TeamsStats(home: TeamStats(league: Stats(fixtures: Games(played: Value(total: 5), wins: Value(total: 5), draws: Value(total: 4), loses: Value(total: 2)), goals: Goals(against: GoalsValue(total: Value(total: 4), average: AverageValue(total: "4.5"))))), away: TeamStats(league: Stats(fixtures: Games(played: Value(total: 5), wins: Value(total: 6), draws: Value(total: 3), loses: Value(total: 3)), goals: Goals(against: GoalsValue(total: Value(total: 5), average: AverageValue(total: "5.6")))))))))
    }
}
