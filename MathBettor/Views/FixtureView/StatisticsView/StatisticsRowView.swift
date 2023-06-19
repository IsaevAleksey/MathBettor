//
//  StatisticsRowView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 30.05.2023.
//

import SwiftUI

struct GamesStatisticsRowView: View {
    let parametr: String
    let homeValue: Int
    let awayValue: Int
    
    var body: some View {
        HStack {
            Image(systemName: "figure.soccer")
                .resizable()
                .frame(width: 30, height: 30)
            Text("\(homeValue)")
                .padding(.leading, 15.0)
            Spacer()
            Text(parametr)
            Spacer()
            Text("\(awayValue)")
                .padding(.trailing, 15.0)
            Image(systemName: "figure.soccer")
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}

struct StatisticsAverageValueRowView: View {
    let parametr: String
    let homeValue: String
    let awayValue: String
    
    var body: some View {
        HStack {
            Image(systemName: "figure.soccer")
                .resizable()
                .frame(width: 30, height: 30)
            Text(homeValue)
                .padding(.leading, 15.0)
            Spacer()
            Text(parametr)
            Spacer()
            Text(awayValue)
                .padding(.trailing, 15.0)
            Image(systemName: "figure.soccer")
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}


struct StatisticsRowView_Previews: PreviewProvider {
    static var previews: some View {
        GamesStatisticsRowView(parametr: "GAMES", homeValue: 5, awayValue: 6)
    }
}
