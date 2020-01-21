//
//  EventCell.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 8
        return view
    }()

    let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        label.textColor = .systemGray
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 18)
        label.numberOfLines = 0
        return label
    }()

    let authoredByLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        label.textColor = .systemGray
        return label
    }()

    let authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.numberOfLines = 0
        return label
    }()

    let authorUrlLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()

    var item: DetailsViewModelItem? {
        didSet {
            if let item = item as? EventCellViewModel {
                captionLabel.text = item.caption
                titleLabel.text = item.title
                authoredByLabel.text = item.authoredBy
                authorNameLabel.text = item.authorName
                authorUrlLabel.text = item.authorUrl
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }

    func setupCell() {
        stackView.addArrangedSubview(captionLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(authoredByLabel)
        stackView.addArrangedSubview(authorNameLabel)
        stackView.addArrangedSubview(authorUrlLabel)

        stackView.setCustomSpacing(20, after: titleLabel)

        containerView.addSubview(stackView)
        addSubview(containerView)

        NSLayoutConstraint.activate([

            // Container view
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // Stack view with labels
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
}
