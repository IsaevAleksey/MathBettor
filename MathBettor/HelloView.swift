//
//  HelloView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 01.05.2023.
//

import SwiftUI

struct HelloView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5.0) {
                Text("Здесь будет предупреждение о разумном подходе")
                    .multilineTextAlignment(.center)
                NavigationLink("OK") { LeagueListView() }
            }
        }
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
