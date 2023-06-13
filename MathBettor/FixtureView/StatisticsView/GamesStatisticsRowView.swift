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
            Text("\(homeValue)")
                .bold()
                .frame(width: 25)
                .padding(.leading, 15.0)
            Spacer()
            Text(parametr)
            Spacer()
            Text("\(awayValue)")
                .bold()
                .frame(width: 25)
                .padding(.trailing, 15.0)
        }
            .foregroundColor(.white)
            .frame(height: 40)
            .background(BackgroundColor())
            .cornerRadius(20)
    }
}

struct GamesAverageStatisticsRowView: View {
    let parametr: String
    let homeValue: String
    let awayValue: String
    
    var body: some View {
        HStack {
            Text(homeValue)
                .bold()
                .frame(width: 35)
                .padding(.leading, 15.0)
            Spacer()
            Text(parametr)
            Spacer()
            Text(awayValue)
                .bold()
                .frame(width: 35)
                .padding(.trailing, 15.0)
        }
            .foregroundColor(.white)
            .frame(height: 40)
            .background(BackgroundColor())
            .cornerRadius(20)
    }
}

struct GamesStatisticsRowView_Previews: PreviewProvider {
    static var previews: some View {
        GamesStatisticsRowView(parametr: "GAMES", homeValue: 5, awayValue: 60)
    }
}

