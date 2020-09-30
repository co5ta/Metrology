//
//  CategoryCell.swift
//  UConvert
//
//  Created by co5ta on 28/09/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    var category: Category? {
        didSet { configure() }
    }
    
    private func configure() {
        guard let category = category else { return }
        backgroundColor = .brown
        titleLabel.text = category.rawValue
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
