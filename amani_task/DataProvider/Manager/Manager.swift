//
//  Manager.swift
//  amani_task
//
//  Created by Aysema Çam on 4.03.2024.
//

import Foundation

final class ServiceManager {
    
    static let shared = ServiceManager()
    
    func fetchProducts(from urlString: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "InvalidURL", code: 1001, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "DataError", code: 1002, userInfo: nil)))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(ProductResponse.self, from: data)
                completion(.success(response.images))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

