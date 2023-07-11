//
//  ProgressBarView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 23.05.2023.
//

import SwiftUI

struct ProgressBarView: View {
    let parametrValue: Float
    let aligment: Alignment
    let color: Color
    
    var body: some View {
        ProgressBar(value: parametrValue / 100, aligment: aligment, color: color)
            .frame(height: 10)
    }
}

struct ProgressBar: View {
    let value: Float
    let aligment: Alignment
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: aligment) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(.systemTeal))
                Rectangle().frame(
                    width: min(CGFloat(value)*geometry.size.width, geometry.size.width),
                    height: geometry.size.height
                )
                .foregroundColor(color)
            }
            .cornerRadius(45)
        }
    }
}


struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(parametrValue: 50.0, aligment: .leading, color: Color(.systemBlue))
    }
}
