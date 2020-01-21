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

    private func downloadImage(imageUrl: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        if let url = URL(string: imageUrl) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion(.failure(NetworkError.network))
                }

                if let imageData = data {
                    completion(.success(imageData))
                }
            }

            dataTask.resume()
        }
    }

    private func prepareData(lastEvent: Event?) {
        if let selectedRepo = selectedRepo {

            // Download avatar image
            downloadImage(imageUrl: selectedRepo.owner.avatarUrl) { [weak self] response in
                switch response {
                case .failure(let error):
                    print("Error downloading the image from URL: \(selectedRepo.owner.avatarUrl) | Error: \(error.reason)")
                    self?.formatItems(lastEvent: lastEvent, avatarData: nil)

                case .success(let imageData):
                    self?.formatItems(lastEvent: lastEvent, avatarData: imageData)
                }
            }
        }

    }

    private func formatItems(lastEvent: Event?, avatarData: Data?) {
        if let selectedRepo = selectedRepo {
            let aboutItem = AboutCellViewModel(title: selectedRepo.name, subTitle: selectedRepo.url)
            items.append(aboutItem)

            let ownerItem = OwnerCellViewModel(
                avatar: avatarData,
                caption: "OWNER",
                title: selectedRepo.owner.login,
                subTitle: selectedRepo.owner.url
            )

            items.append(ownerItem)
        }

        if let lastEvent = lastEvent {
            let eventItem = EventCellViewModel(
                caption: "LAST EVENT",
                title: lastEvent.type,
                authoredBy: "AUTHORED BY",
                authorName: lastEvent.actor.displayLogin,
                authorUrl: lastEvent.actor.url
            )

            items.append(eventItem)
        }

        DispatchQueue.main.async { [weak self] in
            self?.delegate?.onFetchEventsCompleted()
        }
    }

    func fetchEvents(username: String, repoName: String) {
        detailsGateway.fetch(username: username, repoName: repoName) { [weak self] response in

            switch response {

            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.onFetchEventsFailed(with: error.reason)
                }

            case .success(let events):
                self?.prepareData(lastEvent: events.first)
            }
        }
    }
}
