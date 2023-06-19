//
//  GridItemView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 05.06.2023.
//

import SwiftUI

struct GridItemView: View {
    let score: String
    let probability: Double
    
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .clipShape(Rectangle())
                .frame(width: 110, height: 50)
                .cornerRadius(10)
            VStack(alignment: .center) {
                Text(score)
                    .bold()
                Text("\(probability, specifier: "%.2f")%")
            }
            .foregroundColor(.white)
        }
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(score: "0-0", probability: 30.5)
    }
}
