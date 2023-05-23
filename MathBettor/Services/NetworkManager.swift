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
    
    // скорее всего надо будет убрать, не пригодится
//    func fetchImage(from url: String) async throws -> Data {
//        guard let imageUrl = URL(string: url) else { throw NetworkError.invalidURL}
//        guard let imageData = try? Data(contentsOf: imageUrl) else { throw NetworkError.noData }
//        return imageData
//    }
    
    func fetchLeaguesList() async throws -> CompetitionsList {
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
    
    func fetchStatistics(fixtureID: Int) async throws  -> Statistics {
        var request = URLRequest(
            url: URL(string: "https://v3.football.api-sports.io/predictions?fixture=\(fixtureID)")!,
            timeoutInterval: 10.0)
        request.addValue("2d3297ddd732374c7f607d900b0d9c69", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        guard let statistics = try? JSONDecoder().decode(Statistics.self, from: data) else {
            throw NetworkError.decodingError
        }
        return statistics
    }
    
    
//    func fetchResponse<T: Decodable>(_ type: T.Type, completion: @escaping(Result<T, NetworkError>) -> Void) {
//        var request = URLRequest(
//            url: URL(string: "https://v3.football.api-sports.io/leagues")!,
//            timeoutInterval: 10.0)
//        request.addValue("2d3297ddd732374c7f607d900b0d9c69", forHTTPHeaderField: "x-rapidapi-key")
//        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
//        request.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            guard let data = data else {
//                completion(.failure(.noData))
//                return
//            }
//            do {
//                let type = try JSONDecoder().decode(T.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(type))
//                }
//            } catch {
//                completion(.failure(.decodingError))
//            }
//        }.resume()
//    }
}


