//
//  CustomButton.swift
//  GithubUsers
//
//  Created by Filipe Donadio on 20/01/20.
//  Copyright © 2020 Filipe Donadio. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        layer.cornerRadius = 8
        backgroundColor = Colors.lightGray
        setTitleColor(.black, for: .normal)
        tintColor = .black
        titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)

        let personIcon = UIImage(systemName: "person.fill")
        setImage(personIcon, for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
    }
}
