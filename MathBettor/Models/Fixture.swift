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
    let data: String
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

