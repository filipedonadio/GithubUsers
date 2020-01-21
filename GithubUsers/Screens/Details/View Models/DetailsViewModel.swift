//
//  DetailsViewModel.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

protocol DetailsViewModelDelegate: class {
    func onFetchEventsCompleted()
    func onFetchEventsFailed(with reason: String)
}

class DetailsViewModel {

    weak var delegate: DetailsViewModelDelegate?
    private var detailsGateway: DefaultDetailsGateway

    var selectedRepo: Repository?
    var items = [DetailsViewModelItem]()

    init(detailsGateway: DefaultDetailsGateway) {
        self.detailsGateway = detailsGateway
    }

    private func formatItems(lastEvent: Event) {
        if let selectedRepo = selectedRepo {
            let aboutItem = AboutCellViewModel(title: selectedRepo.name, subTitle: selectedRepo.url)
            items.append(aboutItem)
        }

        delegate?.onFetchEventsCompleted()
    }

    func fetchEvents(username: String, repoName: String) {
        detailsGateway.fetch(username: username, repoName: repoName) { [weak self] response in

            switch response {

            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.onFetchEventsFailed(with: error.reason)
                }

            case .success(let events):
                DispatchQueue.main.async { [weak self] in
                    self?.formatItems(lastEvent: events[0])
                }
            }
        }
    }
}
