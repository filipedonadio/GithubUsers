//
//  DefaultDetailsGateway.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

class DefaultDetailsGateway: DetailsGateway {

    let requestManager: RequestManager

    init(requestManager: RequestManager = DefaultRequestManager()) {
        self.requestManager = requestManager
    }

    func fetch(username: String, repoName: String, completion: @escaping DetailsGateway.Completion) {
        let request = EventRequest(username: username, repoName: repoName)

        requestManager.execute(request: request) { response in
            completion(response)
        }
    }
}
