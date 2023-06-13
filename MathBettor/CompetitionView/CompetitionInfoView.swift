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
        ZStack {
            BackgroundColor()
            VStack {
//                Spacer()
                CompetitionImage(imageURL: imageURL, imageSize: CGSize(width: 100, height: 100), cornerRadius: 10, shadowIsOn: true)
                    .frame(width: 100, height: 100)
                    .padding(.top)
                Text(competitionCountry)
                Text(competitionName)
                    .font(.largeTitle)
//                    .padding(.bottom)
            }
            .foregroundColor(.white)
        }
        .cornerRadius(20)
        .ignoresSafeArea()
    }
}

struct CompetitionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionInfoView(imageURL: "", competitionCountry: "name Country", competitionName: "competition name")
    }
}
