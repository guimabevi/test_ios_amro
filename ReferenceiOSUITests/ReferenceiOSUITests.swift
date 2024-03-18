//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest

class ReferenceiOSUITests: XCTestCase {
    var app : XCUIApplication!
    var label : XCUIElement!
    var button : XCUIElement!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        label = app.staticTexts["Label"]
        button = app.buttons["Button"]
    }
    
    func testGenerateRandomValue() {
        // Ensure the label starts with Hello
        XCTAssertEqual(label.label, "Hello")
        
        // Tap on the Generate button
        button.tap()
        
        XCTAssertFalse(label.label.isEmpty)
        XCTAssertTrue(label.label.hasPrefix("€"), "Generated amount should start with € symbol")
        XCTAssertTrue(label.label.contains("."), "Generated amount should contain a decimal point")
    }
    
    func testDifferentAmounts() {
        var previousText = ""
        for _ in 0..<5 {
            button.tap()
            let currentText = label.label
            
            XCTAssertNotEqual(currentText, previousText, "Generated amounts should be different")
            previousText = currentText
        }
    }
    
    func testRotateAndGenerateNumber() {
        // Rotate the simulator
        XCUIDevice.shared.orientation = .landscapeLeft
        sleep(2)
        button.tap()
        XCTAssertTrue(label.exists, "Label should exist after tapping the button")
    }
    
    func testBackgroundRecovery() {
        button.tap()
        let initialLabelValue = label.label
        
        // Put the app into the background
        XCUIDevice.shared.press(.home)
        sleep(2)
        
        // Bring the app back to the foreground
        app.activate()
        
        // Get the label's value after recovery
        let recoveredLabelValue = label.label
        
        // Assert that the label's value is the same as before
        XCTAssertEqual(initialLabelValue, recoveredLabelValue, "Label's value should be the same after background recovery")
    }
    
    func testLabelTapAction() {
        // Get the initial value of the label
        let initialLabelValue = label.label
        label.tap()
        
        // Get the label value after tapping
        let updatedLabelValue = label.label
        
        // Assert that the label value remains the same
        XCTAssertEqual(initialLabelValue, updatedLabelValue, "Tapping on the label should not trigger any action")
    }
}


