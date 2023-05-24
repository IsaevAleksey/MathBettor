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

    var roundHomeParametrValue: Float {
        let roundValue = roundf(NSString(string: homeTeamParametrValue).floatValue)
        return roundValue
    }
    
    var roundAwayParametrValue: Float {
        let roundValue = roundf(NSString(string: awayTeamParametrValue).floatValue)
        return roundValue
    }
    
    var body: some View {
        VStack {
            Text(parametr)
                HStack {
                    Text("\(Int(roundHomeParametrValue))")
                    ProgressBarView(parametrValue: roundHomeParametrValue, aligment: .trailing, color: Color(.systemBlue))
//                        .frame(width: 115)
                    ProgressBarView(parametrValue: roundAwayParametrValue, aligment: .leading, color: Color(.systemMint))
//                        .frame(width: 115)
                    Text("\(Int(roundAwayParametrValue))")
                }
        }
    }
}

struct StatisticsRowView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsRowView(parametr: "TOTAL", homeTeamParametrValue: "90.933", awayTeamParametrValue: "60")
    }
}
