//
//  DefaultRequestManager.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

struct DefaultRequestManager: RequestManager {

    func execute<T: Decodable>(request: NetworkRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {

        guard let baseUrl = URL(string: NetworkConfiguration.baseUrl) else {
            completion(.failure(NetworkError.invalidEndpoint))
            return
        }

        guard var urlComponents = URLComponents(url: baseUrl.appendingPathComponent(request.path), resolvingAgainstBaseURL: true) else {
            completion(.failure(NetworkError.invalidEndpoint))
            return
        }

        var queryItems = [URLQueryItem]()

        if let parameters = request.parameters {
            queryItems.append(contentsOf: parameters)
        }

        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else {
            completion(.failure(NetworkError.invalidEndpoint))
            return
        }

        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(NetworkError.network))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.network))
                return
            }

            let decoder = JSONDecoder()

            do {
                let decodedObject = try decoder.decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(NetworkError.decoding))
            }
        }

        dataTask.resume()
    }
}
