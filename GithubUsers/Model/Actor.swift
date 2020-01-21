//
//  Actor.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

struct Actor: Decodable {

    let displayLogin: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case displayLogin = "display_login"
        case url
    }
}
