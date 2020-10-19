//
//  OutburstViewUITest.swift
//  GetGoodUITests
//
//  Created by Hiago Chagas on 26/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import XCTest
@testable import GetGood

class OutburstViewUITest: XCTestCase {
    
    
//    func test_outburstView_isTextFieldEditable(){
//        let app = XCUIApplication()
//        app.launch()
//        
//        let tabBarClick = app.tabBars.buttons["Outburst"]
//        XCTAssertTrue(tabBarClick.isHittable)
//        tabBarClick.tap()
//        
//        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
//        XCTAssertTrue(textField.isHittable)
//        textField.tap()
//    }
    
    func test_outburstView_isSaveButtonWorking(){
        let app = XCUIApplication()
        app.launch()
        
        let tabBarClick = app.tabBars.buttons["Outburst"]
        XCTAssertTrue(tabBarClick.isHittable)
        tabBarClick.tap()
        
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        XCTAssertTrue(textField.isHittable)
        textField.tap()
        textField.typeText("I would like some cake")
        
        let saveButton = app/*@START_MENU_TOKEN@*/.staticTexts["Save"]/*[[".buttons[\"Save\"].staticTexts[\"Save\"]",".staticTexts[\"Save\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(saveButton.isHittable)
        saveButton.tap()
        
        let tableCell = app.tables/*@START_MENU_TOKEN@*/.textViews/*[[".cells.textViews",".textViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["I would like some cake"]
        XCTAssertTrue(tableCell.isHittable)
        
        let cancelButton = app.navigationBars["GetGood.SavedOutburstsVC"].buttons["Cancel"]
        XCTAssertTrue(cancelButton.isHittable)
        cancelButton.tap()
    }
    func test_outburstView_isBurnButtonWorking(){
        let app = XCUIApplication()
        app.launch()
        
        let tabBarClick = app.tabBars.buttons["Outburst"]
        XCTAssertTrue(tabBarClick.isHittable)
        tabBarClick.tap()
        
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        XCTAssertTrue(textField.isHittable)
        textField.tap()
        textField.typeText("I would like some cake")
        
        let burnButton = app.staticTexts["Burn"]
        XCTAssertTrue(burnButton.isHittable)
        burnButton.tap()
    }
}
