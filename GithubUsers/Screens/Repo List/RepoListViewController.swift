//
//  RepoListViewController.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import UIKit

class RepoListViewController: UITableViewController, AlertDisplayer {

    var viewModel: RepoListViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }

    var username: String?
    var page = 1

    let itemCellId = "itemCellId"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupTable()
        fetchRepos()
    }

    private func setupNavigationBar() {
        title = "Repository list"
        navigationController?.navigationBar.tintColor = Colors.tintColor
    }

    private func setupTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: itemCellId)
    }

    private func fetchRepos() {
        if let username = username {
            viewModel?.fetchRepos(for: username, page: page)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.repositories.count
        }

        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let viewModel = viewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: itemCellId, for: indexPath)
            cell.textLabel?.text = viewModel.repositories[indexPath.row].name
            cell.accessoryType = .detailButton
            cell.tintColor = Colors.tintColor

            return cell
        }

        return UITableViewCell()
    }

    // MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        guard let username = username else { return }

        let lastItem = viewModel.repositories.count - 1

        if indexPath.row == lastItem && tableView.contentOffset.y > 0 {
            page += 1
            viewModel.fetchRepos(for: username, page: page)
        }
    }
}

extension RepoListViewController: RepoListViewModelDelegate {

    func onFetchReposCompleted() {
        tableView.reloadData()
    }

    func onFetchReposFailed(with reason: String) {
        let title = "Warning"
        let action = UIAlertAction(title: "OK", style: .default)
        displayAlert(with: title, message: reason, actions: [action])
    }
}
