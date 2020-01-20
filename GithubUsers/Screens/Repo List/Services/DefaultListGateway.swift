//
//  DefaultListGateway.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

class DefaultListGateway: ListGateway {

    let requestManager: RequestManager

    init(requestManager: RequestManager = DefaultRequestManager()) {
        self.requestManager = requestManager
    }

    func fetch(username: String, completion: @escaping ListGateway.Completion) {
        let request = ListRequest(username: username)

        requestManager.execute(request: request) { response in
            completion(response)
        }
    }
}
