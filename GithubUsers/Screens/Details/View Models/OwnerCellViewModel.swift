//
//  OwnerCellViewModel.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

class OwnerCellViewModel: DetailsViewModelItem {

    var type: DetailsViewModelItemType {
        .ownerCard
    }

    var rowCount: Int {
        return 1
    }

    let avatar: Data?
    let caption: String
    let title: String
    let subTitle: String

    init(avatar: Data?, caption: String, title: String, subTitle: String) {
        self.avatar = avatar
        self.caption = caption
        self.title = title
        self.subTitle = subTitle
    }
}
