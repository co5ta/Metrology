//
//  Storage.swift
//  Metrology
//
//  Created by co5ta on 10/11/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation

/// Struct to manages the data storage
struct Storage {
    /// Standard UserDefaults instance
    static let shared = UserDefaults.standard
    
    /// Document directory
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    /// Saves a list of dimension
    static func save(dimensions: [Dimension], of category: Category) {
        let filePath = documentDirectory.appendingPathComponent(category.rawValue)
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: dimensions, requiringSecureCoding: false)
            try data.write(to: filePath)
        } catch {
            print(#function, error.localizedDescription)
        }
    }
    
    /// Fetchs saved dimensions of a category
    static func getDimensions(of category: Category) -> [Dimension]? {
        let filePath = documentDirectory.appendingPathComponent(category.rawValue)
        guard let data = try? Data(contentsOf: filePath),
              let dimensions = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Dimension]
        else { return nil }
        return dimensions
    }
    
    static func save(variationSelected: Dimension, for dimension: Dimension) {
        let filePath = documentDirectory.appendingPathComponent(dimension.symbol)
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: variationSelected, requiringSecureCoding: false)
            try data.write(to: filePath)
        } catch {
            print(#function, error.localizedDescription)
        }
    }
    
    static func getVariationSelected(for dimension: Dimension) -> Dimension? {
        let filePath = documentDirectory.appendingPathComponent(dimension.symbol)
        guard let data = try? Data(contentsOf: filePath),
              let dimension = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Dimension
        else { return nil }
        return dimension
    }
}
