//
//  WelcomeViewController.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    var welcomeView = WelcomeView()

    override func loadView() {
        view = welcomeView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtons()
    }

    private func setupButtons() {
        welcomeView.jakeButton.setTitle("JakeWharton", for: .normal)
        welcomeView.infinumButton.setTitle("infinum", for: .normal)

        welcomeView.jakeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        welcomeView.infinumButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        let repoListVC = RepoListViewController()
        repoListVC.viewModel = RepoListViewModel(listGateway: DefaultListGateway())
        repoListVC.username = sender.title(for: .normal)
        navigationController?.pushViewController(repoListVC, animated: true)
    }
}
