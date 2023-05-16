//
//  TeamLogoImage.swift
//  MathBettor
//
//  Created by Алексей Исаев on 11.05.2023.
//

import SwiftUI

struct TeamLogoImage: View {
    let teamLogoURL: String
//    let imageSize: CGSize
//    let cornerRadius: CGFloat
//    let shadowIsOn: Bool
    
    var body: some View {
        AsyncImage(url: URL(string: teamLogoURL)) { Image in
            Image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
                .shadow(radius: 10)
        } placeholder: {
            ProgressView()
        }

    }
}

struct TeamLogoImage_Previews: PreviewProvider {
    static var previews: some View {
        TeamLogoImage(teamLogoURL: "")
    }
}
