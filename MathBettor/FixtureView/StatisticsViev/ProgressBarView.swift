//
//  ProgressBarView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 23.05.2023.
//

import SwiftUI

struct ProgressBarView: View {
    
    let parametr: String
    let homeTeamParametrValue: String
    let awayTeamParametrValue: String
    let aligment: Alignment
    let color: Color
    
    var body: some View {
        
        ProgressBar(value: (Float(homeTeamParametrValue) ?? 0) / 100, aligment: aligment, color: color)
            .frame(height: 10)
    }
}


struct ProgressBar: View {
    
    var value: Float
    var aligment: Alignment
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: aligment) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                .foregroundColor(Color(.systemTeal))
                Rectangle().frame(width: min(CGFloat(value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(color)
            }
            .cornerRadius(45)
        }
    }
}


struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(parametr: "FORM", homeTeamParametrValue: "40", awayTeamParametrValue: "60", aligment: .leading, color: Color(.systemBlue))
    }
}
