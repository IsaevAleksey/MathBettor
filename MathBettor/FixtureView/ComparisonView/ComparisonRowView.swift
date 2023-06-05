//
//  StatisticsRowView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 20.05.2023.
//

import SwiftUI

struct ComparisonRowView: View {
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
                    ProgressBarView(parametrValue: roundHomeParametrValue, aligment: .trailing, color: Color(#colorLiteral(red: 0.0941176488995552, green: 0.3529411852359772, blue: 0.615686297416687, alpha: 1)))
                    ProgressBarView(parametrValue: roundAwayParametrValue, aligment: .leading, color: Color(#colorLiteral(red: 0.26274511218070984, green: 0.8078431487083435, blue: 0.6352941393852234, alpha: 1)))
                    Text("\(Int(roundAwayParametrValue))%")
                }
        }
    }
}

struct ComparisonRowView_Previews: PreviewProvider {
    static var previews: some View {
        ComparisonRowView(parametr: "TOTAL", homeTeamParametrValue: "90.933", awayTeamParametrValue: "60")
    }
}
