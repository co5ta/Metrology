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
        case UnitArea.squareMeters:
            return [
                UnitArea.squareMegameters,
                UnitArea.squareKilometers,
                UnitArea.squareMeters,
                UnitArea.squareCentimeters,
                UnitArea.squareMillimeters,
                UnitArea.squareMicrometers,
                UnitArea.squareNanometers
            ]
        case UnitEnergy.joules:
            return [
                UnitEnergy.kilojoules,
                UnitEnergy.joules
                
            ]
        case UnitEnergy.calories:
            return [
                UnitEnergy.kilocalories,
                UnitEnergy.calories
                
            ]
        case UnitElectricCharge.ampereHours:
            return [
                UnitElectricCharge.megaampereHours,
                UnitElectricCharge.kiloampereHours,
                UnitElectricCharge.ampereHours,
                UnitElectricCharge.milliampereHours,
                UnitElectricCharge.microampereHours
            ]
        case UnitLength.meters:
            return [
                UnitLength.megameters,
                UnitLength.kilometers,
                UnitLength.hectometers,
                UnitLength.decameters,
                UnitLength.meters,
                UnitLength.decimeters,
                UnitLength.centimeters,
                UnitLength.millimeters,
                UnitLength.micrometers,
                UnitLength.nanometers,
                UnitLength.picometers
            ]
        case UnitMass.kilograms:
            return [
                UnitMass.kilograms,
                UnitMass.grams,
                UnitMass.decigrams,
                UnitMass.centigrams,
                UnitMass.milligrams,
                UnitMass.micrograms,
                UnitMass.nanograms,
                UnitMass.picograms
            ]
        case UnitPower.watts:
            return [
                UnitPower.terawatts,
                UnitPower.gigawatts,
                UnitPower.megawatts,
                UnitPower.kilowatts,
                UnitPower.watts,
                UnitPower.milliwatts,
                UnitPower.microwatts,
                UnitPower.nanowatts,
                UnitPower.picowatts,
                UnitPower.femtowatts
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
        default:
            return nil
        }
    }
}
