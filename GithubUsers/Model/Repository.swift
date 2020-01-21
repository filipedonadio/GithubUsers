//
//  Repository.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

struct Repository: Decodable {

    let name: String
    let url: String
    let owner: Owner
}
