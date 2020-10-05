//
//  UnitViewModel.swift
//  UConvert
//
//  Created by co5ta on 04/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation

/// View model of a unit
struct UnitViewModel {

    /// Unit to manage
    private var unit: Dimension
    
    /// Initialisation
    init(unit: Dimension) {
        self.unit = unit
    }
    
    /// Title of the unit
    var title: String {
        Self.formatter.string(from: unit).capitalized
    }
    
    /// Value of the unit
    var value: Double {
        unit.converter.baseUnitValue(fromValue: 1)
    }
    
    /// Display formatter of the unit
    static var formatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        return formatter
    }()
}
