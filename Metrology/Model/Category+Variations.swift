//
//  Category+Variations.swift
//  Metrology
//
//  Created by co5ta on 12/11/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import Foundation

extension Category {
    
    static func getVariations(of dimension: Dimension) -> [Dimension]? {
        switch dimension {
        case UnitVolume.liters:
            return [
                UnitVolume.megaliters,
                UnitVolume.kiloliters,
                UnitVolume.liters,
                UnitVolume.deciliters,
                UnitVolume.centiliters,
                UnitVolume.milliliters
            ]
        case UnitVolume.cubicMeters:
            return [
                UnitVolume.cubicKilometers,
                UnitVolume.cubicMeters,
                UnitVolume.cubicDecimeters,
                UnitVolume.cubicCentimeters,
                UnitVolume.cubicMillimeters
            ]
        case UnitPressure.hectopascals:
            return [
                UnitPressure.gigapascals,
                UnitPressure.megapascals,
                UnitPressure.kilopascals,
                UnitPressure.hectopascals
            ]
        case UnitPressure.bars:
            return [
                UnitPressure.bars,
                UnitPressure.millibars
            ]
        default:
            return nil
        }
    }
}
