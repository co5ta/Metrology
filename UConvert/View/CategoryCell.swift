//
//  CategoryCell.swift
//  UConvert
//
//  Created by co5ta on 28/09/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var category: CategoryViewModel? {
        didSet { configure() }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 10
    }
}

extension CategoryCell {
    private func configure() {
        guard let category = category else { return }
        titleLabel.text = category.title
        imageView.image = UIImage(named: category.imageName)
        descriptionLabel.text = category.description
    }
}
