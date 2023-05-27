//
//  HelloView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 01.05.2023.
//

import SwiftUI

struct HelloView: View {
    @State private var showCountriesList = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 5.0) {
                Text("Здесь будет предупреждение о разумном подходе")
                    .multilineTextAlignment(.center)
                Button(action: {
                    self.showCountriesList.toggle()
                }) {
                    Text("OK")
                }
                .fullScreenCover(isPresented: $showCountriesList) {
                    CountriesListView(viewModel: CountriesListViewModel())
                }
            }
        }
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
