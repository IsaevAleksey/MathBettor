//
//  StatisticsView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 31.05.2023.
//

import SwiftUI

struct StatisticsView: View {
    @StateObject var viewModel: StatisticsViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text("CHAMPIONSHIP STATISTICS")
                    .bold()
                    .padding(.vertical)
                Text("GAMES")
                GamesStatisticsRowView(parametr: "PLAYED", homeValue: viewModel.homePlayedMatch.played.total, awayValue: viewModel.awayPlayedMatch.played.total)
                GamesStatisticsRowView(parametr: "WIN", homeValue: viewModel.homePlayedMatch.wins.total, awayValue: viewModel.awayPlayedMatch.wins.total)
                GamesStatisticsRowView(parametr: "DRAW", homeValue: viewModel.homePlayedMatch.draws.total, awayValue: viewModel.awayPlayedMatch.draws.total)
                GamesStatisticsRowView(parametr: "LOSES", homeValue: viewModel.homePlayedMatch.loses.total, awayValue: viewModel.awayPlayedMatch.loses.total)
            }
            VStack {
                Text("GOALS SCORED")
                    .padding(.top)
                GoalsStatisticsRowView(parametr: "TOTAL", homeValue: viewModel.homeGoalsScored.total.total, awayValue: viewModel.awayGoalsScored.total.total)
                GoalsAverageStatisticsRowView(parametr: "AVERAGE", homeValue: viewModel.homeGoalsScored.average.total, awayValue: viewModel.awayGoalsScored.average.total)
            }
            VStack {
                Text("GOALS AGAINST")
                    .padding(.top)
                GoalsStatisticsRowView(parametr: "TOTAL", homeValue: viewModel.homeGoalsAgainst.total.total, awayValue: viewModel.awayGoalsAgainst.total.total)
                GoalsAverageStatisticsRowView(parametr: "AVERAGE", homeValue: viewModel.homeGoalsAgainst.average.total, awayValue: viewModel.awayGoalsAgainst.average.total)
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(viewModel: StatisticsViewModel(teamsStats: TeamsStats(home: TeamStats(id: 54, league: Stats(fixtures: Games(played: Value(total: 5), wins: Value(total: 5), draws: Value(total: 4), loses: Value(total: 2)), goals: Goals(scored: GoalsValue(total: Value(total: 5), average: AverageValue(total: "5.4")), against: GoalsValue(total: Value(total: 4), average: AverageValue(total: "4.5"))))), away: TeamStats(id: 56, league: Stats(fixtures: Games(played: Value(total: 5), wins: Value(total: 6), draws: Value(total: 3), loses: Value(total: 3)), goals: Goals(scored: GoalsValue(total: Value(total: 7), average: AverageValue(total: "6.4")), against: GoalsValue(total: Value(total: 5), average: AverageValue(total: "5.6"))))))))
    }
}
