//
//  Event.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

struct Event: Decodable {

    let type: String
    let actor: Actor
}
