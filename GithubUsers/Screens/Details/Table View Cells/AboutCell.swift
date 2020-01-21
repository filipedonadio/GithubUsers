//
//  AboutCell.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 21/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 24)
        label.numberOfLines = 0
        return label
    }()

    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
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
            if let item = item as? AboutCellViewModel {
                titleLabel.text = item.title
                subTitleLabel.text = item.subTitle
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
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
