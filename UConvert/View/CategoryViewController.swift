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
    let categoryCollectionViewDelegate = CategoryCollectionViewDelegate(categories: CategoryViewModel.all)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension CategoryViewController {
    private func configure() {
        categoryCollectionViewDelegate.viewController = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? UnitsViewController,
            let cell = sender as? CategoryCell
            else { return }
        vc.category = cell.category
    }
}
