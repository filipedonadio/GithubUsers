//
//  RequestManager.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

protocol RequestManager {

    func execute<T: Decodable>(request: NetworkRequest, completion: @escaping (Result<T, NetworkError>) -> Void)
}
