//
//  Fixture.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import Foundation

struct FixturesList: Decodable {
    let response: [FixtureInfo]
}

struct FixtureInfo: Decodable {
    let fixture: Fixture
    let teams: Teams
}

struct Fixture: Decodable {
    let id: Int
    let date: String
}

struct Teams: Decodable {
    let home: Team
    let away: Team
}

struct Team: Decodable {
    let id: Int
    let name: String
    let logo: String
}


// убрать
extension FixturesList {
    static func fetchPsevdoFixturesList() -> FixturesList {
        FixturesList(response: [FixtureInfo(fixture: Fixture(id: 10, date: ""), teams: Teams(home: Team(id: 15, name: "team1", logo: "logo1"), away: Team(id: 16, name: "team2", logo: "logo2")))])
    }
}

extension FixtureInfo {
    static func fetchPsevdoFixtureInfo() -> FixtureInfo {
        FixtureInfo(fixture: Fixture(id: 10, date: "2022-10-10 123123123"), teams: Teams(home: Team(id: 15, name: "team1", logo: "logo1"), away: Team(id: 16, name: "team2", logo: "logo2")))
    }
}
