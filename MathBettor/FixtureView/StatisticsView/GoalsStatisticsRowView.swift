//
//  GoalsStatisticsView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 31.05.2023.
//

import SwiftUI

struct GoalsStatisticsRowView: View {
    let parametr: String
    let homeValue: Int
    let awayValue: Int
    
    var body: some View {
        HStack {
            Image(systemName: "soccerball")
                .resizable()
                .frame(width: 30, height: 30)
            Text("\(homeValue)")
                .frame(width: 25)
                .padding(.leading, 15.0)
            Spacer()
            Text(parametr)
            Spacer()
            Text("\(awayValue)")
                .frame(width: 25)
                .padding(.trailing, 15.0)
            Image(systemName: "soccerball")
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}

struct GoalsAverageStatisticsRowView: View {
    let parametr: String
    let homeValue: String
    let awayValue: String
    
    var body: some View {
        HStack {
            Image(systemName: "soccerball")
                .resizable()
                .frame(width: 30, height: 30)
            Text(homeValue)
                .padding(.leading, 15.0)
            Spacer()
            Text(parametr)
            Spacer()
            Text(awayValue)
                .padding(.trailing, 15.0)
            Image(systemName: "soccerball")
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}

struct GoalsStatisticsRowView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsStatisticsRowView(parametr: "for", homeValue: 2, awayValue: 5)
    }
}
