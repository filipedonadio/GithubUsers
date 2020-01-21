//
//  DetailsView.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import UIKit

class DetailsView: UIView {

    let navigationBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.isTranslucent = false
        navBar.barTintColor = .systemGray4
        return navBar
    }()

    let tableView: UITableView = {
        let table = UITableView()
        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        table.allowsSelection = false
        table.separatorStyle = .none
        table.tableFooterView = UIView()
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNavigationBar()
        setupTableView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNavigationBar()
        setupTableView()
    }

    private func setupNavigationBar() {
        addSubview(navigationBar)

        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    private func setupTableView() {
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 56),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
