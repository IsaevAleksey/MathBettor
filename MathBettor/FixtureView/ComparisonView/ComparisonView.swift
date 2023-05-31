//
//  StatisticsView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 20.05.2023.
//

import SwiftUI

struct ComparisonView: View {
    @StateObject var viewModel: ComparisonViewModel
    
    var body: some View {
        VStack {
            Text("COMPARISON")
                .bold()
                .padding(.bottom)
            ComparisonRowView(parametr: "FORM", homeTeamParametrValue: viewModel.form.home, awayTeamParametrValue: viewModel.form.away)
            ComparisonRowView(parametr: "ATT", homeTeamParametrValue: viewModel.att.home, awayTeamParametrValue: viewModel.att.away)
            ComparisonRowView(parametr: "DEF", homeTeamParametrValue: viewModel.def.home, awayTeamParametrValue: viewModel.def.away)
            ComparisonRowView(parametr: "H2H", homeTeamParametrValue: viewModel.h2h.home, awayTeamParametrValue: viewModel.h2h.away)
            ComparisonRowView(parametr: "TOTAL", homeTeamParametrValue: viewModel.total.home, awayTeamParametrValue: viewModel.total.away)
            ComparisonRowView(parametr: "POISSON DISTRIBUTION", homeTeamParametrValue: viewModel.poissonDistribution.home, awayTeamParametrValue: viewModel.poissonDistribution.away)
        }
    }
}


struct SratisticsView_Previews: PreviewProvider {
    static var previews: some View {
        ComparisonView(viewModel: ComparisonViewModel(statisticsInfo: StatisticsInfo(predictions: Prediction(advice: "advice", percent: Percent(home: "20%", draw: "30%", away: "50%")), comparison: Comparison(form: TeamComparisonValue(home: "20", away: "10"), att: TeamComparisonValue(home: "30", away: "45"), def: TeamComparisonValue(home: "30", away: "60"), poissonDistribution: TeamComparisonValue(home: "25", away: "70"), h2h: TeamComparisonValue(home: "30", away: "40"), total: TeamComparisonValue(home: "50", away: "70")), teams: TeamsStats(home: TeamStats(id: 55, league: Stats(fixtures: Games(played: Value(total: 5), wins: Value(total: 5), draws: Value(total: 4), loses: Value(total: 2)), goals: Goals(scored: GoalsValue(total: Value(total: 5), average: AverageValue(total: "5.4")), against: GoalsValue(total: Value(total: 4), average: AverageValue(total: "4.5"))))), away: TeamStats(id: 55, league: Stats(fixtures: Games(played: Value(total: 5), wins: Value(total: 6), draws: Value(total: 3), loses: Value(total: 3)), goals: Goals(scored: GoalsValue(total: Value(total: 7), average: AverageValue(total: "6.4")), against: GoalsValue(total: Value(total: 5), average: AverageValue(total: "5.6")))))))))
    }
}
