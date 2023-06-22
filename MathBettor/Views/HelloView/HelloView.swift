//
//  HelloView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 01.05.2023.
//

import SwiftUI

struct HelloView: View {
    @State var showCompetitionsList = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundGradient
                    .ignoresSafeArea()
                VStack(spacing: 20.0) {
                    Text(
                        "The predictions are only based on statistics and do not take into account other factors (e.g. weather, game strategy, physical condition of the players etc.)"
                    )
                    .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        self.showCompetitionsList.toggle()
                    }) {
                        Text("OK")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }
                        .fullScreenCover(isPresented: $showCompetitionsList) {
                            CompetitionsListView(viewModel: CompetitionsListViewModel())
                    }
                }
                .padding(16)
            }
        }
            .preferredColorScheme(.light)
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
