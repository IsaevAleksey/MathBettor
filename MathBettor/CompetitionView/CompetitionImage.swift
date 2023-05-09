//
//  CompetitionImage.swift
//  MathBettor
//
//  Created by Алексей Исаев on 03.05.2023.
//

import SwiftUI

struct CompetitionImage: View {
    let imageURL: String
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { Image in
            Image
                .resizable()
                .frame(width: imageSize.width, height: imageSize.height)
                .cornerRadius(cornerRadius)
                .shadow(radius: shadowIsOn ? 10 : 0)
        } placeholder: {
            ProgressView()
        }
    }
}

struct CompetitionImage_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionImage(imageURL: "", imageSize: CGSize(width: 150, height: 150), cornerRadius: 30, shadowIsOn: true)
    }
}
