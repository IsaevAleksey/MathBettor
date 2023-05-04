//
//  CompetitionImage.swift
//  MathBettor
//
//  Created by Алексей Исаев on 03.05.2023.
//

import SwiftUI

struct CompetitionImage: View {
    let imageData: Data
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowIsOn ? 10 : 0)
    }
    
    private func getImage(from data: Data) -> Image {
        guard let image = UIImage(data: data) else {
            return Image(systemName: "xmark.shield")
        }
        return Image(uiImage: image)
    }
    
}

struct CompetitionImage_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionImage(
            imageData: Data(),
            imageSize: CGSize(width: 150, height: 150),
            cornerRadius: 30,
            shadowIsOn: true
        )
    }
}
