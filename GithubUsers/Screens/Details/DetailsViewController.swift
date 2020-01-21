//
//  DetailsViewController.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, AlertDisplayer {

    var viewModel: DetailsViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }

    let detailsView = DetailsView()

    override func loadView() {
        view = detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupTableView()

        if let viewModel = viewModel {
            guard let selectedRepoOwnerName = viewModel.selectedRepo?.owner.login else { return }
            guard let selectedRepoName = viewModel.selectedRepo?.name else { return }
            viewModel.fetchEvents(username: selectedRepoOwnerName, repoName: selectedRepoName)
        }
    }

    @objc func closeModal() {
        dismiss(animated: true)
    }

    private func setupNavBar() {
        let navItem = UINavigationItem(title: "Repository details")
        navItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeModal))
        detailsView.navigationBar.setItems([navItem], animated: false)
    }

    private func setupTableView() {
        detailsView.tableView.dataSource = self
        detailsView.tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.identifier)
        detailsView.tableView.register(OwnerCell.self, forCellReuseIdentifier: OwnerCell.identifier)
        detailsView.tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.identifier)
    }
}

// MARK: - Table view data source

extension DetailsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        if let viewModel = viewModel {
            return viewModel.items.count
        }

        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.items[section].rowCount
        }

        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let viewModel = viewModel {

            let item = viewModel.items[indexPath.section]

            switch item.type {

            case .about:
                if let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.identifier, for: indexPath) as? AboutCell {
                    cell.item = item
                    return cell
                }

            case .ownerCard:
                if let cell = tableView.dequeueReusableCell(withIdentifier: OwnerCell.identifier, for: indexPath) as? OwnerCell {
                    cell.item = item
                    return cell
                }

            case .eventCard:
                if let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier, for: indexPath) as? EventCell {
                    cell.item = item
                    return cell
                }
            }
        }

        return UITableViewCell()
    }
}

extension DetailsViewController: DetailsViewModelDelegate {

    func onFetchEventsCompleted() {
        detailsView.tableView.reloadData()
    }

    func onFetchEventsFailed(with reason: String) {
        let title = "Warning"
        let action = UIAlertAction(title: "OK", style: .default)
        displayAlert(with: title, message: reason, actions: [action])
    }
}
