//
//  RepoListViewController.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import UIKit

class RepoListViewController: UITableViewController {

    var items = [String]()
    let itemCellId = "itemCellId"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupTable()
    }

    private func setupNavigationBar() {
        title = "Repository list"
        navigationController?.navigationBar.tintColor = Colors.tintColor
    }

    private func setupTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: itemCellId)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: itemCellId, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.accessoryType = .detailButton
        cell.tintColor = Colors.tintColor

        return cell
    }
}
