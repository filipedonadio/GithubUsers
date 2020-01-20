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
        
    }
}
