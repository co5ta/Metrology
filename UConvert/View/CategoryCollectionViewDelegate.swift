//
//  CategoryCollectionViewDelegate.swift
//  UConvert
//
//  Created by co5ta on 29/09/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation
import UIKit

/// Delegate of the categories collection view
class CategoryCollectionViewDelegate: NSObject {
    
    /// View controller containing the collection view
    var viewController: CategoryViewController? {
        didSet { bind() }
    }
    
    /// Categories to display
    var categories: [CategoryViewModel] = [] {
        didSet { update() }
    }
    
    /// Initialization
    init(categories: [CategoryViewModel]) {
        self.categories = categories
    }
    
    /// Links the delegate to the collection view
    private func bind() {
        guard let viewController = viewController else { return }
        viewController.categoryCollectionView.dataSource = self
        viewController.categoryCollectionView.delegate = self
    }
    
    /// Update the collection view
    private func update() {
        viewController?.categoryCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension CategoryCollectionViewDelegate: UICollectionViewDataSource {
    
    /// Asks your data source object for the number of items in the specified section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    /// Asks your data source object for the cell that corresponds to the specified item in the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell
            else { return UICollectionViewCell() }
        cell.category = categories[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CategoryCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    
    /// Asks the delegate for the size of the specified item’s cell
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 15) / 2
        return CGSize(width: width, height: width * 0.65)
    }
}

// MARK: - UICollectionViewDelegate
extension CategoryCollectionViewDelegate: UICollectionViewDelegate {}
