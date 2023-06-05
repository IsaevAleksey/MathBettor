//
//  ColorView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 05.06.2023.
//

import SwiftUI

struct BackgroundColor: View {
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.26274511218070984, green: 0.8078431487083435, blue: 0.6352941393852234, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.0941176488995552, green: 0.3529411852359772, blue: 0.615686297416687, alpha: 1)), location: 1)]),
                        startPoint: .top,
                        endPoint: .bottom))
                .ignoresSafeArea()
        }

    }
}

struct BackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundColor()
    }
}
