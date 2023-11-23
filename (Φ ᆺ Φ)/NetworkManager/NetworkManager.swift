//
//  NetworkManager.swift
//  (Φ ᆺ Φ)
//
//  Created by Tekla on 11/19/23.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://catfact.ninja/"
    private let limit = "332"
    private let maxFact = "facts?limit="
    
    private init() {}
    
    func fetchFacts(completion: @escaping (Result<[CatFacts], Error>) -> Void) {
        let urlStr = "\(baseURL)\(maxFact)\(limit)"
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let factResults = try JSONDecoder().decode(FactResults.self, from: data)
                completion(.success(factResults.data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
