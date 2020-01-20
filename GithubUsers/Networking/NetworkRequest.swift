//
//  NetworkRequest.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

class NetworkRequest {

    let path: String
    let parameters: [URLQueryItem]?

    init(path: String, parameters: [URLQueryItem]?) {
        self.path = path
        self.parameters = parameters
    }
}
