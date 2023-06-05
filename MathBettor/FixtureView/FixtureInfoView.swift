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
            Color(.systemMint)
                .ignoresSafeArea()
            VStack(spacing: 16.0) {
                HStack(alignment: .top, spacing: 100.0) {
                    VStack {
                        TeamLogoImage(teamLogoURL: homeTeamLogoURL)
                            .frame(height: 50)
                        Text(homeTeamName)
//                            .multilineTextAlignment(.center)
                    }
                    VStack {
                        TeamLogoImage(teamLogoURL: awayTeamLogoURL)
                            .frame(height: 50)
                        Text(awayTeamName)
                    }
                }
                Text(fixtureDate)
                    .fontWeight(.thin)
                    .padding(.bottom)
            }
//            Spacer()
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
