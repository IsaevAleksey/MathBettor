//
//  CircularProgressBarView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.05.2023.
//

import SwiftUI

struct CircularProgressBarView: View {
    let value: String
    
    var body: some View {
        ZStack {
            CircularProgressBar(value: value)
                .frame(width: 100, height: 100)
            Text(value)
        }
    }
}

struct CircularProgressBar: View {
    let value: String

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.mint.opacity(0.3), lineWidth: 10)
            Circle()
                .trim(from: 0, to: CGFloat(NSString(string: value).floatValue) / 100 )
                .stroke(Color("CircularProgressBar"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: value)
        }
    }
}


struct CircularProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBarView(value: "50%")
    }
}
