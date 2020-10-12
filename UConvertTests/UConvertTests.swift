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
        let unitVM = categoryVM.units[0]
        let unitLengthVM = UnitViewModel(unit: UnitLength.baseUnit())
        XCTAssertEqual(unitVM.unit, unitLengthVM.unit)
        XCTAssertEqual(unitVM.title, "Meters")
        XCTAssertEqual(unitVM.value, "1")
        XCTAssertEqual(unitVM.baseUnitValue, 1)
    }
    
    func testWhenBaseUnitValueChangedUnitValueMustBeUpdated() {
        // Given
        let unitVM = UnitViewModel(unit: UnitAngle.radians)
        XCTAssertEqual(unitVM.value, "0.017453292519943295")
        XCTAssertEqual(unitVM.baseUnitValue, 1)
        // When
        unitVM.baseUnitValue = 3
        // Then
        XCTAssertEqual(unitVM.value, "0.05235987755982988")
    }
}
