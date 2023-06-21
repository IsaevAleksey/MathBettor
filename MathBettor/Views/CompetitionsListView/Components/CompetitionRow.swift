//
//  CompetitionRow.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import SwiftUI

struct CompetitionRow: View {
    let competitionName: String
    let competitionCountry: String
    let competitionImageURL: String
    
    var body: some View {
        HStack(spacing: 16.0) {
            CompetitionImage(
                imageURL: competitionImageURL,
                imageSize: CGSize(width: 40, height: 40),
                cornerRadius: 10, shadowIsOn: false
            )
            VStack(alignment: .leading) {
                Text(competitionCountry)
                    .fontWeight(.ultraLight)
                Text(competitionName)
            }
        }
    }
}

struct CompetitionRow_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionRow(competitionName: "name", competitionCountry: "country", competitionImageURL: "url")
    }
}
