//
//  EmpireMobileStrikeBackUITests.swift
//  EmpireMobileStrikeBackUITests
//
//  Created by Badr Choukri on 15/10/2018.
//  Copyright © 2018 Badr Choukri. All rights reserved.
//

import XCTest

class EmpireMobileStrikeBackUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    // MARK: Test UI

    func testNormalCaseOfUtilisation() {        
        let app = XCUIApplication()
        app.tables.cells.allElementsBoundByIndex[0].tap()
        app.buttons["back"].tap()
        app.tables.cells.allElementsBoundByIndex[2].tap()
        app.buttons["back"].tap()
    }
}
