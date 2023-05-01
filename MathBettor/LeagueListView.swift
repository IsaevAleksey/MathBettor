//
//  LeagueListView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import SwiftUI

struct LeagueListView: View {
    @StateObject private var viewModel = LeagueListViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.leaguesList, id: \.league.id) { leagueInfo in
                    Text (leagueInfo.league.name)
                }
            }
            .navigationTitle("Select competition")
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueListView()
    }
}

