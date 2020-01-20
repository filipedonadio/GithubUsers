//
//  ListGateway.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

protocol ListGateway {

    typealias Completion = (ListResponse) -> Void
    func fetch(username: String, completion: @escaping Completion)
}
