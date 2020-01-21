//
//  EventRequest.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

class EventRequest: NetworkRequest {

    init(username: String, repoName: String) {
        super.init(path: "repos/\(username)/\(repoName)/events", parameters: nil)
    }
}
