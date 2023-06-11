//
//  NetworkManager.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init () {}
    
    
//    func fetchImage(from url: String, completion: @escaping(Result<Data, NetworkError>) -> Void ) {
//        guard let url = URL(string: url) else {
//            completion(.failure(.invalidURL))
//            return
//        }
//
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: url) else {
//                completion(.failure(.noData))
//                return
//            }
//            DispatchQueue.main.async {
//                completion(.success(imageData))
//            }
//        }
//    }
    // скорее всего надо будет убрать, не пригодится
//    func fetchImage(from url: String) async throws -> Data {
//        guard let imageUrl = URL(string: url) else { throw NetworkError.invalidURL}
//        guard let imageData = try? Data(contentsOf: imageUrl) else { throw NetworkError.noData }
//        return imageData
//    }
    
    func fetchImage(from url: String) throws -> Data {
        guard let imageUrl = URL(string: url) else { throw NetworkError.invalidURL}
        guard let imageData = try? Data(contentsOf: imageUrl) else { return Data() }
        return imageData
    }
    
    func fetchCompetitionsList() async throws -> CompetitionsList {
        var request = URLRequest(
            url: URL(string: "https://v3.football.api-sports.io/leagues")!,
            timeoutInterval: 10.0)
        request.addValue("2d3297ddd732374c7f607d900b0d9c69", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)
        guard let competitionsList = try? JSONDecoder().decode(CompetitionsList.self, from: data) else {
            throw NetworkError.decodingError
        }
        return competitionsList
    }
        
    func fetchFixturesList(leagueID: Int, currentSeason: Int, fromDate: String, toDate: String) async throws -> FixturesList {
        var request = URLRequest(
            url: URL(string: "https://v3.football.api-sports.io/fixtures?league=\(leagueID)&season=\(currentSeason)&from=\(fromDate)&to=\(toDate)")!,
            timeoutInterval: 10.0)
        request.addValue("2d3297ddd732374c7f607d900b0d9c69", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)
        guard let fixturesList = try? JSONDecoder().decode(FixturesList.self, from: data) else {
            throw NetworkError.decodingError
        }
        return fixturesList
    }
    
    func fetchStatistics(fixtureID: Int) async throws  -> StatisticsData {
        var request = URLRequest(
            url: URL(string: "https://v3.football.api-sports.io/predictions?fixture=\(fixtureID)")!,
            timeoutInterval: 10.0)
        request.addValue("2d3297ddd732374c7f607d900b0d9c69", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let statistics = try? decoder.decode(StatisticsData.self, from: data) else {
//        guard let statistics = try? JSONDecoder().decode(Statistics.self, from: data) else {
            throw NetworkError.decodingError
        }
        return statistics
    }
}


