//
//  RepoListViewModel.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import Foundation

protocol RepoListViewModelDelegate: class {

    func onFetchReposCompleted()
    func onFetchReposFailed(with reason: String)
}

final class RepoListViewModel {

    weak var delegate: RepoListViewModelDelegate?
    private var listGateway: DefaultListGateway

    var repositories = [Repository]()

    init(listGateway: DefaultListGateway) {
        self.listGateway = listGateway
    }

    func fetchRepos(for username: String) {
        listGateway.fetch(username: username) { [weak self] response in

            switch response {

            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.onFetchReposFailed(with: error.reason)
                }

            case .success(let repos):
                DispatchQueue.main.async { [weak self] in
                    self?.repositories = repos
                    self?.delegate?.onFetchReposCompleted()
                }
            }
        }
    }
}
