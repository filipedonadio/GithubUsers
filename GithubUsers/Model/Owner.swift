//
//  Owner.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

struct Owner: Decodable {

    let login: String
    let url: String
    let avatarUrl: String

    enum CodingKeys: String, CodingKey {
        case login
        case url
        case avatarUrl = "avatar_url"
    }
}
