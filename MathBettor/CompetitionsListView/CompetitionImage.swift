//
//  CompetitionImage.swift
//  MathBettor
//
//  Created by Алексей Исаев on 03.05.2023.
//

import SwiftUI

struct CompetitionImage: View {
//    let imageData: Data
    let imageURL: String
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
        
    var body: some View {
//        if let uiImage = UIImage(data: imageData) {
//            Image(uiImage: uiImage)
//                .resizable()
//                .resizable()
//                .frame(width: imageSize.width, height: imageSize.height)
//                .cornerRadius(cornerRadius)
//                .shadow(radius: shadowIsOn ? 10 : 0)
//        } else {
//            ProgressView()
//        }
        CacheAsyncImage(imageURL: imageURL) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .cornerRadius(cornerRadius)
                    .shadow(radius: shadowIsOn ? 10 : 0)
            case .empty:
                ProgressView()
            case .failure:
                Image(systemName: "xmark.shield")
            @unknown default:
                Image(systemName: "xmark.shield")
            }
        }

//        AsyncImage(url: URL(string: imageURL)) { image in
//            image
//                .resizable()
//                .frame(width: imageSize.width, height: imageSize.height)
//                .cornerRadius(cornerRadius)
//                .shadow(radius: shadowIsOn ? 10 : 0)
//        } placeholder: {
//            ProgressView()
//        }
    }
}

struct CompetitionImage_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionImage(imageURL: "", imageSize: CGSize(width: 150, height: 150), cornerRadius: 30, shadowIsOn: true)
    }
}
