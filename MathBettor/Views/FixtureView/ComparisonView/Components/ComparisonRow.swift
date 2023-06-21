//
//  StatisticsRowView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 20.05.2023.
//

import SwiftUI

struct ComparisonRow: View {
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
                    Text("\(Int(roundHomeParametrValue))%")
                    ProgressBarView(
                        parametrValue: roundHomeParametrValue,
                        aligment: .trailing,
                        color: Color("ProgressBarHome")
                    )
                    ProgressBarView(
                        parametrValue: roundAwayParametrValue,
                        aligment: .leading,
                        color: Color("ProgressBarAway")
                    )
                    Text("\(Int(roundAwayParametrValue))%")
                }
        }
    }
}

struct ComparisonRowView_Previews: PreviewProvider {
    static var previews: some View {
        ComparisonRow(parametr: "TOTAL", homeTeamParametrValue: "90.933", awayTeamParametrValue: "60")
    }
}
