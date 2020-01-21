//
//  DetailsGateway.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

protocol DetailsGateway {

    typealias Completion = (EventResponse) -> Void
    func fetch(username: String, repoName: String, completion: @escaping Completion)
}
