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
    
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetchLeagueList(completion: @escaping(Result<LeagueList, NetworkError>) -> Void) {
        var request = URLRequest(
            url: URL(string: "https://v3.football.api-sports.io/leagues")!,
            timeoutInterval: 10.0)
        request.addValue("2d3297ddd732374c7f607d900b0d9c69", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let response = try JSONDecoder().decode(LeagueList.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

func fetchResponse<T: Decodable>(_ type: T.Type, completion: @escaping(Result<T, NetworkError>) -> Void) {
    var request = URLRequest(
        url: URL(string: "https://v3.football.api-sports.io/leagues")!,
        timeoutInterval: 10.0)
    request.addValue("2d3297ddd732374c7f607d900b0d9c69", forHTTPHeaderField: "x-rapidapi-key")
    request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
    request.httpMethod = "GET"

    URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data else {
            completion(.failure(.noData))
            return
        }
        do {
            let type = try JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                completion(.success(type))
            }
        } catch {
            completion(.failure(.decodingError))
        }
    }.resume()
}
