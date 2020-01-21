//
//  AboutCellViewModel.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

class AboutCellViewModel: DetailsViewModelItem {

    var type: DetailsViewModelItemType {
        .about
    }

    var rowCount: Int {
        return 1
    }

    let title: String
    let subTitle: String

    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
}
