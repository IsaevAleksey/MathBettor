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
            Text("PREDICTION")
                .bold()
                .padding(.vertical)
            StatisticsRowView(parametr: "POISSON DISTRIBUTION", homeTeamParametrValue: viewModel.poisson_distribution.home, awayTeamParametrValue: viewModel.poisson_distribution.away)
            Text(viewModel.advice)
                .padding(.top)
        }
    }
}

struct SratisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(viewModel: StatisticsViewModel(statisticsInfo: StatisticsInfo(predictions: Prediction(advice: "noo advice", percent: Percent(home: "30", draw: "20", away: "50")), comparison: Comparison(form: TeamStats(home: "10", away: "15"), att: TeamStats(home: "20", away: "30"), def: TeamStats(home: "10", away: "20"), poisson_distribution: TeamStats(home: "30", away: "70"), h2h: TeamStats(home: "5", away: "10"), total: TeamStats(home: "10", away: "20")))))
    }
}
