//
//  CompetitionRow.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import SwiftUI

struct CompetitionRow: View {
    let competitionName: String
    let competitionImageData: Data
    
    var body: some View {
        HStack {
            CompetitionImage(imageData: competitionImageData, imageSize: CGSize(width: 40, height: 40), cornerRadius: 10, shadowIsOn: false)
            Text(competitionName)
        }
    }
}

struct CompetitionRow_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionRow(competitionName: "name", competitionImageData: Data())
    }
}
