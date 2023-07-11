//
//  FixtureInfoView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 05.06.2023.
//

import SwiftUI

struct FixtureInfoView: View {
    let homeTeamLogoURL: String
    let awayTeamLogoURL: String
    let homeTeamName: String
    let awayTeamName: String
    let fixtureDate: String
    
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
            VStack(spacing: 8.0) {
                Spacer()
                HStack(alignment: .top, spacing: 100.0) {
                    VStack {
                        TeamLogoImage(teamLogoURL: homeTeamLogoURL)
                        Text(homeTeamName)
                            .multilineTextAlignment(.center)
                    }
                    VStack {
                        TeamLogoImage(teamLogoURL: awayTeamLogoURL)
                        Text(awayTeamName)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.horizontal, 16.0)
                Text(fixtureDate)
                    .fontWeight(.thin)
                    .padding(.bottom)
            }
            .bold()
            .foregroundColor(.white)
        }
        .cornerRadius(20)
        .ignoresSafeArea()
    }
}

struct FixtureInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FixtureInfoView(homeTeamLogoURL: "", awayTeamLogoURL: "", homeTeamName: "home", awayTeamName: "away", fixtureDate: "20-02-2023 00001122")
    }
}
