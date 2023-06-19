//
//  BackgroundGradient.swift
//  MathBettor
//
//  Created by Алексей Исаев on 19.06.2023.
//

import SwiftUI

extension Color {
    static let backgroundGradient = LinearGradient(
        gradient: Gradient(
            stops: [
                .init(color: Color("GradientStart"), location: 0),
                .init(color: Color("GradientStop"), location: 1)
            ]
        ),
        startPoint: .top,
        endPoint: .bottom)
}
