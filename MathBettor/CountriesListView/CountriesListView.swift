//
//  CountriesListView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 27.05.2023.
//

import SwiftUI

struct CountriesListView: View {
    @StateObject var viewModel: CountriesListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.rows, id: \.countryName) { competitionsListViewModel in
                NavigationLink(destination: CompetitionsListView(viewModel: competitionsListViewModel)) {
                    Text(competitionsListViewModel.countryName)
                        .frame(height: 50)
                }
            }
            .navigationTitle("Select country")
            .listStyle(.automatic)
        }
        .task {
            if viewModel.rows.isEmpty {
                await viewModel.fetchCountriesList()
                print("загражается список стран")
            }
        }
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView(viewModel: CountriesListViewModel())
    }
}
