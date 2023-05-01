//
//  LeagueListView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import SwiftUI

struct LeagueListView: View {
    
    @State var leagueList: [LeagueModel] = []

    var body: some View {
        
        VStack {
            Text("Select competition")
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueListView()
    }
}


extension LeagueListView {

    func fetchLeagueList() {
        NetworkManager.shared.fetchLeagueList { result in
            switch result {
            case .success(let leagues):
                leagueList = leagues.response
            case .failure(let error):
                print(error)
            }
        }
    }

}
