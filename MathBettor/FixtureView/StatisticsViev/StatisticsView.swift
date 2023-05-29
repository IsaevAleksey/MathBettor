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
            Text("STATISTICS")
                .bold()
                .padding(.bottom)
            StatisticsRowView(parametr: "FORM", homeTeamParametrValue: viewModel.form.home, awayTeamParametrValue: viewModel.form.away)
            StatisticsRowView(parametr: "ATT", homeTeamParametrValue: viewModel.att.home, awayTeamParametrValue: viewModel.att.away)
            StatisticsRowView(parametr: "DEF", homeTeamParametrValue: viewModel.def.home, awayTeamParametrValue: viewModel.def.away)
            StatisticsRowView(parametr: "H2H", homeTeamParametrValue: viewModel.h2h.home, awayTeamParametrValue: viewModel.h2h.away)
            StatisticsRowView(parametr: "TOTAL", homeTeamParametrValue: viewModel.total.home, awayTeamParametrValue: viewModel.total.away)
            StatisticsRowView(parametr: "POISSON DISTRIBUTION", homeTeamParametrValue: viewModel.poissonDistribution.home, awayTeamParametrValue: viewModel.poissonDistribution.away)
        }
    }
}

struct SratisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(viewModel: StatisticsViewModel(statisticsInfo: StatisticsInfo(predictions: Prediction(advice: "noo advice", percent: Percent(home: "30", draw: "20", away: "50")), comparison: Comparison(form: TeamStatsValue(home: "10", away: "15"), att: TeamStatsValue(home: "20", away: "30"), def: TeamStatsValue(home: "10", away: "20"), poissonDistribution: TeamStatsValue(home: "30", away: "70"), h2h: TeamStatsValue(home: "5", away: "10"), total: TeamStatsValue(home: "10", away: "20")))))
    }
}
