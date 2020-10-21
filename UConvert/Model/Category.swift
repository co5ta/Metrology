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
    case Length, Area, Volume, Angle
    case Mass, Pressure
    case Acceleration, Duration, Speed
    case Energy, Power, Temperature
    case ElectricCharge
    case FuelEfficiency
    
    var title: String {
        switch self {
        case .Length: return Strings.length
        case .Area: return Strings.area
        case .Volume: return Strings.volume
        case .Angle: return Strings.angle
        case .Mass: return Strings.mass
        case .Pressure: return Strings.pressure
        case .Acceleration: return Strings.acceleration
        case .Duration: return Strings.duration
        case .Speed: return Strings.speed
        case .Energy: return Strings.energy
        case .Power: return Strings.power
        case .Temperature: return Strings.temperature
        case .ElectricCharge: return Strings.electricCharge
        case .FuelEfficiency: return Strings.fuelEfficiency
        }
    }
    
    /// Units available in a category
    var units: [Unit] {
        switch self {
        // Base units must take the first place at each array
        case .Length: return [
                UnitLength.meters,
                UnitLength.feet,
                UnitLength.inches,
                UnitLength.yards,
                UnitLength.miles,
                UnitLength.scandinavianMiles,
                UnitLength.lightyears,
                UnitLength.fathoms,
                UnitLength.furlongs,
                UnitLength.astronomicalUnits,
                UnitLength.parsecs
            ]
        case .Area: return [
                UnitArea.squareMeters,
                UnitArea.squareInches,
                UnitArea.squareFeet,
                UnitArea.squareYards,
                UnitArea.squareMiles,
                UnitArea.hectares,
                UnitArea.acres,
                UnitArea.ares
            ]
        case .Volume: return [
                UnitVolume.liters,
                UnitVolume.cubicFeet,
                UnitVolume.cubicYards,
                UnitVolume.cubicMiles,
                UnitVolume.acreFeet,
                UnitVolume.bushels,
                UnitVolume.teaspoons,
                UnitVolume.fluidOunces,
                UnitVolume.cups,
                UnitVolume.metricCups,
                UnitVolume.pints,
                UnitVolume.quarts,
                UnitVolume.gallons,
                UnitVolume.imperialTeaspoons,
                UnitVolume.imperialTablespoons,
                UnitVolume.imperialPints,
                UnitVolume.imperialQuarts,
                UnitVolume.imperialGallons,
                UnitVolume.imperialFluidOunces,
            ]
        case .Angle: return [
                UnitAngle.degrees,
                UnitAngle.radians,
                UnitAngle.gradians,
                UnitAngle.revolutions,
                UnitAngle.arcMinutes,
                UnitAngle.arcSeconds
            ]
        case .Mass: return [
                UnitMass.kilograms,
                UnitMass.pounds,
                UnitMass.metricTons,
                UnitMass.shortTons,
                UnitMass.stones,
                UnitMass.carats,
                UnitMass.ounces,
                UnitMass.ouncesTroy,
                UnitMass.slugs
            ]
        case .Pressure: return [
                UnitPressure.newtonsPerMetersSquared,
                UnitPressure.bars,
                UnitPressure.millimetersOfMercury,
                UnitPressure.inchesOfMercury,
                UnitPressure.poundsForcePerSquareInch
            ]
        case .Acceleration: return [
                UnitAcceleration.metersPerSecondSquared,
                UnitAcceleration.gravity
            ]
        case .Duration: return [
                UnitDuration.seconds,
                UnitDuration.minutes,
                UnitDuration.hours
            ]
        case .Speed: return [
                UnitSpeed.metersPerSecond,
                UnitSpeed.kilometersPerHour,
                UnitSpeed.milesPerHour,
                UnitSpeed.knots
            ]
        case .Energy: return [
                UnitEnergy.joules,
                UnitEnergy.calories,
                UnitEnergy.kilowattHours
            ]
        case .Power: return [
                UnitPower.watts,
                UnitPower.horsepower
            ]
        case .Temperature: return [
                UnitTemperature.kelvin,
                UnitTemperature.celsius,
                UnitTemperature.fahrenheit
            ]
        case .ElectricCharge: return [
                UnitElectricCharge.coulombs,
                UnitElectricCharge.ampereHours
            ]
        case .FuelEfficiency: return [
                UnitFuelEfficiency.litersPer100Kilometers,
                UnitFuelEfficiency.milesPerGallon,
                UnitFuelEfficiency.milesPerImperialGallon,
            ]
        }
    }
}
