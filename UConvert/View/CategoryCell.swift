//
//  CategoryCell.swift
//  UConvert
//
//  Created by co5ta on 28/09/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

/// Cell of a category
class CategoryCell: UICollectionViewCell {
    
    /// Image of a category
    @IBOutlet weak var imageView: UIImageView!
    
    /// Title of a category
    @IBOutlet weak var titleLabel: UILabel!
    
    /// Description of a category
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /// Category to display
    var category: CategoryViewModel? {
        didSet { configure() }
    }
    
    /// Initialization
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 10
    }
    
    /// Configures the cell with data
    private func configure() {
        guard let category = category else { return }
        titleLabel.text = category.title
        imageView.image = UIImage(named: category.imageName)
        descriptionLabel.text = category.description
    }
}
