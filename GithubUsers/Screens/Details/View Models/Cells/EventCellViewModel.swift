//
//  EventCellViewModel.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

class EventCellViewModel: DetailsViewModelItem {

    var type: DetailsViewModelItemType {
        .eventCard
    }

    var rowCount: Int {
        return 1
    }

    let caption: String
    let title: String
    let authoredBy: String
    let authorName: String
    let authorUrl: String

    init(caption: String, title: String, authoredBy: String, authorName: String, authorUrl: String) {
        self.caption = caption
        self.title = title
        self.authoredBy = authoredBy
        self.authorName = authorName
        self.authorUrl = authorUrl
    }
}
