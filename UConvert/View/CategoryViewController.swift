//
//  ViewController.swift
//  UConvert
//
//  Created by co5ta on 27/09/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    let categoryCollectionViewDelegate = CategoryCollectionViewDelegate(categories: Category.allCases)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .red
        categoryCollectionView.backgroundColor = .blue
    }
}

extension CategoryViewController {
    private func configure() {
        categoryCollectionViewDelegate.viewController = self
    }
}
