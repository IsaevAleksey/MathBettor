//
//  StatisticsRowView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 20.05.2023.
//

import SwiftUI

struct StatisticsRowView: View {
    
    let parametr: String
    let homeTeamParametrValue: String
    let awayTeamParametrValue: String

    
    var body: some View {
        VStack {
            Text(parametr)
                .frame(width: 50)
                HStack {
                    Text("\(homeTeamParametrValue)")
                    ProgressBarView(parametr: parametr, homeTeamParametrValue: homeTeamParametrValue, awayTeamParametrValue: awayTeamParametrValue, aligment: .trailing, color: Color(.systemBlue))
                        .frame(width: 115)
                    ProgressBarView(parametr: parametr, homeTeamParametrValue: homeTeamParametrValue, awayTeamParametrValue: awayTeamParametrValue, aligment: .leading, color: Color(.systemMint))
                        .frame(width: 115)
                    Text("\(awayTeamParametrValue)")
                }



                
//            ProgressView("Downloading…", value: Float(homeTeamParametrValue), total: 100)

        }
    }
}

struct StatisticsRowView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsRowView(parametr: "FORM", homeTeamParametrValue: "40", awayTeamParametrValue: "60")
    }
}
