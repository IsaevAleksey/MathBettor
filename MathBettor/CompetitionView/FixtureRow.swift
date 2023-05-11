//
//  FixtureRow.swift
//  MathBettor
//
//  Created by Алексей Исаев on 11.05.2023.
//

import SwiftUI

struct FixtureRow: View {
    let homeTeamLogoURL: String
    let awayTeamLogoURL: String
    let homeTeamName: String
    let awayTeamName: String
    
    var body: some View {
        VStack {
            HStack {
                TeamLogoImage(teamLogoURL: homeTeamLogoURL)
                Text(homeTeamName)
                Spacer()
            }
            HStack {
                TeamLogoImage(teamLogoURL: awayTeamLogoURL)
                Text(awayTeamName)
                Spacer()
            }
        }
    }
}

struct FixtureRow_Previews: PreviewProvider {
    static var previews: some View {
        FixtureRow(homeTeamLogoURL: "", awayTeamLogoURL: "", homeTeamName: "HomeTeam", awayTeamName: "AwayTeam")
    }
}
