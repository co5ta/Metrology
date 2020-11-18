//
//  DimensionViewModel.swift
//  Metrology
//
//  Created by co5ta on 04/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation

/// View model of a unit
class DimensionViewModel {

    /// Unit to manage
    var dimension: Dimension
    
    /// Initialization
    init(dimension: Dimension, baseUnitValue: Double = 1) {
        self.dimension = dimension
        self.baseUnitValue = baseUnitValue
    }
    
    /// Title of the unit
    var title: String {
        Self.formatter.string(from: dimension).capitalized
    }
    
    /// Value of the unit
    var value: Double {
        dimension.converter.value(fromBaseUnitValue: baseUnitValue)
    }
    
    /// Rounded value of the unit
    var textValue: String {
        String(format: "%g", value)
    }
    
    /// Code to execute when the base unit value changed
    var bindValue: (() -> Void)?
    
    /// Value of the cell text field after editing
    var textChanged = ""
    
    /// Value of the base unit to calculate all others values
    var baseUnitValue: Double {
        didSet { bindValue?() }
    }
    
    /// Display formatter of the unit
    static var formatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        return formatter
    }()
}
