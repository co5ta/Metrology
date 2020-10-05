//
//  ViewController.swift
//  UConvert
//
//  Created by co5ta on 27/09/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import UIKit

/// View controller of categories screen
class CategoryViewController: UIViewController {
    
    /// Collection view of categories
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    /// Delegate of the categories collection view
    let categoryCollectionViewDelegate = CategoryCollectionViewDelegate(categories: CategoryViewModel.all)
    
    /// First operations after loading
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionViewDelegate.viewController = self
    }
    
    /// Prepares the transition to next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? UnitsViewController,
            let cell = sender as? CategoryCell
            else { return }
        vc.category = cell.category
    }
}
