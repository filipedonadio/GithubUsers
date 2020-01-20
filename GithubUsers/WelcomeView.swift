//
//  WelcomeView.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import UIKit

class WelcomeView: UIView {

    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "github-logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AvenirNext-Bold", size: 48)
        label.textColor = .white
        label.text = "GitHub"
        return label
    }()

    let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AvenirNext-Regular", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Select a user to see the repository list"
        return label
    }()

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 30
        return stack
    }()

    let jakeButton: CustomButton = {
        let button = CustomButton()
        return button
    }()

    let infinumButton: CustomButton = {
        let button = CustomButton()
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        stackView.addArrangedSubview(jakeButton)
        stackView.addArrangedSubview(infinumButton)

        addSubview(backgroundImageView)
        addSubview(logoImageView)
        addSubview(logoLabel)
        addSubview(stackView)
        addSubview(infoLabel)

        NSLayoutConstraint.activate([
            
            // Background
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // Logo
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 60),
            logoImageView.widthAnchor.constraint(equalToConstant: 230),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1/1),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -40),

            // Stackview with the buttons
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80),
            stackView.heightAnchor.constraint(equalToConstant: 130),

            // Info label
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            infoLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -40)
        ])
    }
}
