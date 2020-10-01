//
//  CategoryViewModel.swift
//  UConvert
//
//  Created by co5ta on 01/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation

struct CategoryViewModel {
    private var category: Category
    var title: String {
        category.rawValue
    }
    var imageName: String {
        category.rawValue
    }
    var description: String {
        category.units.map { Category.formatter.string(from: $0).capitalized }.joined(separator: ", ")
    }
    static var all: [CategoryViewModel] {
        Category.allCases.map { CategoryViewModel(category: $0) }
    }
}
