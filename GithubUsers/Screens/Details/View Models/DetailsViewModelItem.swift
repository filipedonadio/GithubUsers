//
//  DetailsViewModelItem.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

protocol DetailsViewModelItem {

    var type: DetailsViewModelItemType { get }
    var rowCount: Int { get }
}
