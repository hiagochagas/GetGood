//
//  MoodsViewUITest.swift
//  GetGoodUITests
//
//  Created by Hiago Chagas on 25/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import XCTest
@testable import GetGood

class MoodsViewUITest: XCTestCase {
    
    
    func test_MoodView_hasTableView(){
        let app = XCUIApplication()
        app.launch()
        let tableView = app.tables.element
        XCTAssertTrue(tableView.exists)
    }

    func test_MoodView_clickOnModal(){
        let app = XCUIApplication()
        app.launch()

        let tablesQuery = app.tables
        
        let firstRow = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Angry"]/*[[".cells.staticTexts[\"Angry\"]",".staticTexts[\"Angry\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(firstRow.isHittable)
        firstRow.tap()
        
        var cancelButton = app.navigationBars["GetGood.MoodDetailVC"].buttons["Cancel"]
        XCTAssertTrue(cancelButton.isHittable)
        cancelButton.tap()
        
        
        let secondRow = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Lonely"]/*[[".cells.staticTexts[\"Lonely\"]",".staticTexts[\"Lonely\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(secondRow.isHittable)
        secondRow.tap()
        
        cancelButton = app.navigationBars["GetGood.MoodDetailVC"].buttons["Cancel"]
        XCTAssertTrue(cancelButton.isHittable)
        cancelButton.tap()
        
        let thirdRow = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Frustrated"]/*[[".cells.staticTexts[\"Frustrated\"]",".staticTexts[\"Frustrated\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(thirdRow.isHittable)
        thirdRow.tap()
        
        cancelButton = app.navigationBars["GetGood.MoodDetailVC"].buttons["Cancel"]
        XCTAssertTrue(cancelButton.isHittable)
        cancelButton.tap()
        
        let fourthRow = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sad"]/*[[".cells.staticTexts[\"Sad\"]",".staticTexts[\"Sad\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(fourthRow.isHittable)
        fourthRow.tap()
        
        cancelButton = app.navigationBars["GetGood.MoodDetailVC"].buttons["Cancel"]
        XCTAssertTrue(cancelButton.isHittable)
        cancelButton.tap()

    }
}
