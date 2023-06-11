//
//  TeamLogoImage.swift
//  MathBettor
//
//  Created by Алексей Исаев on 11.05.2023.
//

import SwiftUI

struct TeamLogoImage: View {
    let teamLogoURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: teamLogoURL)) { image in
            image
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

//NetworkManager.shared.fetchImage(from: course.imageUrl) { [weak self] result in
//    switch result {
//    case .success(let imageDate):
//        self?.courseImage.image = UIImage(data: imageDate)
//    case .failure(let error):
//        print(error)
//    }
//}
