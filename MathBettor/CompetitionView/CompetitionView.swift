//
//  CompetitionView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import SwiftUI

struct CompetitionView: View {
    var viewModel: CompetitionViewModel
    var body: some View {
        VStack {
            CompetitionImage(
                imageData: viewModel.imageData,
                imageSize: CGSize(width: 150, height: 150),
                cornerRadius: 30,
            shadowIsOn: true)
            Text(viewModel.name)
                .font(.largeTitle)
            Spacer()
        }
    }
}

struct CompetitionView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionView(viewModel: CompetitionViewModel(competitionInfo: CompetitionInfo.fetchPsevdoCompetitionInfo()))
    }
}
