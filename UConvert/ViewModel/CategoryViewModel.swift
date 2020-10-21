//
//  CategoryViewModel.swift
//  UConvert
//
//  Created by co5ta on 01/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation

/// View model of a category
class CategoryViewModel {
    
    /// Category to manage
    private var category: Category
    
    /// Initialization
    init(category: Category) {
        self.category = category
    }
    
    /// Title of the category
    var title: String {
        category.title
    }
    
    /// Image name of the category
    var imageName: String {
        category.rawValue
    }

    /// Description of the category
    var description: String {
        category.units.map {
            UnitViewModel.formatter.string(from: $0).capitalized
        }.joined(separator: ", ")
    }
    
    /// All units of the category
    var units: [UnitViewModel] {
        category.units.map { UnitViewModel(unit: $0 as! Dimension) }
    }
    
    /// All  categories
    static var all: [CategoryViewModel] {
        Category.allCases.map { CategoryViewModel(category: $0) }
    }
}
