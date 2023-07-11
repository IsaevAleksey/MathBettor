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
                    Image("warning_img")
//                        .resizable()
//                        .frame(width: 550, height: 900)
                    Button(action: {
                        self.showCompetitionsList.toggle()
                    }) {
                        Text("OK")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
//                            .frame(width: 50)
//                            .border(.white)
                    }
                    .frame(width: 50)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 2))
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
