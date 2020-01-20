//
//  ListRequest.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

class ListRequest: NetworkRequest {

    init(username: String) {
        var params = [URLQueryItem]()

        params.append(URLQueryItem(name: "sort", value: "updated"))

        super.init(path: "users/\(username)/repos", parameters: params)
    }
}
