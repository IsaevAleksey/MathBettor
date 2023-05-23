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
        Text(viewModel.advice)
    }
}

struct SratisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(viewModel: StatisticsViewModel(statisticsInfo: StatisticsInfo(predictions: Prediction(advice: "noo advice", percent: Percent(home: "30", draw: "20", away: "50")), comparison: Comparison(form: TeamStats(home: "10", away: "15"), att: TeamStats(home: "20", away: "30"), def: TeamStats(home: "10", away: "20"), poisson_distribution: TeamStats(home: "30", away: "70"), h2h: TeamStats(home: "5", away: "10"), total: TeamStats(home: "10", away: "20")))))
    }
}
