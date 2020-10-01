//
//  CategoryCollectionViewDelegate.swift
//  UConvert
//
//  Created by co5ta on 29/09/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation
import UIKit

class CategoryCollectionViewDelegate: NSObject {
    var viewController: CategoryViewController? {
        didSet { bind() }
    }
    var categories: [CategoryViewModel] = [] {
        didSet { update() }
    }
    
    init(categories: [CategoryViewModel]) {
        self.categories = categories
    }
    
    private func bind() {
        guard let viewController = viewController else { return }
        viewController.categoryCollectionView.dataSource = self
        viewController.categoryCollectionView.delegate = self
    }
    
    private func update() {
        viewController?.categoryCollectionView.reloadData()
    }
}

extension CategoryCollectionViewDelegate: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell
            else { return UICollectionViewCell() }
        cell.category = categories[indexPath.row]
        return cell
    }
}

extension CategoryCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 15) / 2
        return CGSize(width: width, height: width * 0.65)
    }
}

extension CategoryCollectionViewDelegate: UICollectionViewDelegate {}
