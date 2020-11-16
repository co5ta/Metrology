//
//  UConvertTests.swift
//  UConvertTests
//
//  Created by co5ta on 09/10/2020.
//  Copyright © 2020 Co5ta. All rights reserved.
//

import XCTest
@testable import UConvert

class UConvertTests: XCTestCase {
    
    func testCategoryPropertiesToDisplayInCategoryListScreen() {
        let categoryVM = CategoryViewModel(category: Category.Length)
        XCTAssertEqual(categoryVM.title, "Length")
        XCTAssertEqual(categoryVM.imageName, categoryVM.title)
        XCTAssertEqual(categoryVM.description, "Meters, Feet, Inches, Yards, Miles, Mile-Scandinavian, Light Years, Fathoms, Furlongs, Astronomical Units, Parsecs")
    }

    func testUnitViewModelPropertiesContainedInCategory() {
        let categoryVM = CategoryViewModel(category: Category.Length)
        let dimensionVM = categoryVM.dimensionVMs[0]
        let unitLengthVM = DimensionViewModel(dimension: UnitLength.baseUnit())
        XCTAssertEqual(dimensionVM.dimension, unitLengthVM.dimension)
        XCTAssertEqual(dimensionVM.title, "Meters")
        XCTAssertEqual(dimensionVM.textValue, "1")
        XCTAssertEqual(dimensionVM.baseUnitValue, 1)
    }
    
    func testWhenBaseUnitValueChangedUnitValueMustBeUpdated() {
        // Given
        let dimensionVM = DimensionViewModel(dimension: UnitAngle.radians)
        XCTAssertEqual(dimensionVM.textValue, "0.017453292519943295")
        XCTAssertEqual(dimensionVM.baseUnitValue, 1)
        // When
        dimensionVM.baseUnitValue = 3
        // Then
        XCTAssertEqual(dimensionVM.textValue, "0.05235987755982988")
    }
}
