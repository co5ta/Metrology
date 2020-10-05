//
//  Category.swift
//  UConvert
//
//  Created by co5ta on 27/09/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation

/// Enum of units categories
enum Category: String, CaseIterable {
    
    // Cases
    case Length
    case Mass
    
    /// Units available in a category
    var units: [Unit] {
        switch self {
        // Base units must take the first place at each array
        case .Length: return [UnitLength.meters, UnitLength.miles, UnitLength.feet, UnitLength.inches]
        case .Mass: return [UnitMass.kilograms, UnitMass.pounds, UnitMass.shortTons, UnitMass.ounces]
        }
    }
}
