//
//  PredictionTabView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 25.05.2023.
//

import SwiftUI

struct PredictionTabView: View {
    @StateObject var viewModel: PredictionTabViewModel

    var body: some View {
        VStack {
            Text("PREDICTION")
                .bold()
                .padding(.bottom)
            HStack(spacing: 30.0) {
                VStack {
                    Text("WIN HOME")
                    CircularProgressBarView(value: viewModel.probabilityWinAndDraw.home)
                }
                VStack {
                    Text("DRAW")
                    CircularProgressBarView(value: viewModel.probabilityWinAndDraw.draw)
                }
                VStack {
                    Text("WIN AWAY")
                    CircularProgressBarView(value: viewModel.probabilityWinAndDraw.away)
                }
            }
            Text("Advice: \(viewModel.advice)")
                .bold()
                .multilineTextAlignment(.center)
                .padding(.vertical, 50.0)
        }
    }
}

struct PredictionTabView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionTabView(viewModel: PredictionTabViewModel(predictions: Prediction(advice: "noo advice", percent: Percent(home: "30", draw: "20", away: "50"))))
    }
}
