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
        didSet { configure() }
    }
    
    /// Categories to display
    var categories: [CategoryViewModel] = [] {
        didSet { update() }
    }
    
    /// Spacing between collection view cells
    private let spacing: CGFloat = 15
    
    /// Number of items by line
    private var itemByLine: CGFloat = 1
    
    /// Initialization
    init(categories: [CategoryViewModel]) {
        self.categories = categories
    }
    
    /// Configures the collection view
    private func configure() {
        guard let categoryCollectionView = viewController?.categoryCollectionView else { return }
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    /// Updates the collection view
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
        var width, height: CGFloat
        switch(collectionView.traitCollection.horizontalSizeClass, collectionView.traitCollection.verticalSizeClass) {
        case (.regular, .regular):
            itemByLine = 4
            width = (collectionView.frame.width - (spacing*5)) / itemByLine
            height = width * 0.5
        case (.regular, .compact), (.compact, .compact):
            width = (collectionView.frame.width - (spacing*4)) / 3
            height = width * 0.5
        default:
            width = (collectionView.frame.width - (spacing*3)) / 2
            height = width * 0.75
        }
        return CGSize(width: width, height: height)
    }
    
    /// Asks the delegate for the spacing between successive rows or columns of a section
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
}

// MARK: - UICollectionViewDelegate
extension CategoryCollectionViewDelegate: UICollectionViewDelegate {}
