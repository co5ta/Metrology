//
//  Category.swift
//  UConvert
//
//  Created by co5ta on 27/09/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation

enum Category: String, CaseIterable {
    case Length
    case Mass
    
    var units: [Unit] {
        switch self {
        case .Length: return [UnitLength.meters, UnitLength.miles, UnitLength.feet, UnitLength.inches]
        case .Mass: return [UnitMass.pounds, UnitMass.grams, UnitMass.shortTons, UnitMass.ounces]
        }
    }
    
    static var formatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        return formatter
    }()
}
