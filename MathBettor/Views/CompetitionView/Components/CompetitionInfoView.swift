//
//  CompetitionInfoView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 05.06.2023.
//

import SwiftUI

struct CompetitionInfoView: View {
    let imageURL: String
    let competitionCountry: String
    let competitionName: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.backgroundGradient
                VStack {
                    Spacer()
                    CompetitionImage(
                        imageURL: imageURL,
                        imageSize: CGSize(width: 180, height: 180),
                        cornerRadius: 10,
                        shadowIsOn: true
                    )
                    .padding(.top)
                    Text(competitionCountry)
                    Text(competitionName)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .frame(width: geometry.size.width - 32)
                        .padding(.bottom, 16.0)
                }
                .bold()
                .foregroundColor(.white)
            }
            .cornerRadius(20)
            .ignoresSafeArea()
        }
    }
}

struct CompetitionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionInfoView(imageURL: "", competitionCountry: "name Country", competitionName: "competition nme")
    }
}
