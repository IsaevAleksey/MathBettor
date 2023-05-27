//
//  PredictionTabViewModel.swift
//  MathBettor
//
//  Created by Алексей Исаев on 25.05.2023.
//

import Foundation

class PredictionTabViewModel: ObservableObject {
    
    var probabilityWinAndDraw: Percent {
        predictions.percent
    }
    
    var advice: String {
        predictions.advice
    }
    
    private let predictions: Prediction

    init(predictions: Prediction) {
        self.predictions = predictions
    }
}
