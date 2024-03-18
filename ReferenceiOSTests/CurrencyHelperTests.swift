//
//  CurrencyHelperTests.swift
//  ReferenceiOSTests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest
@testable import ReferenceiOS


class CurrencyHelperTests: XCTestCase {
    
    func testFormatRounding() {
        let number: NSNumber = 129.999
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 130,00")
    }
    
    func testFormatRegular() {
        let number: NSNumber = 122
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 122,00")
    }
    
    func testFormatDecimals() {
        let number: NSNumber = 122.50
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 122,50")
    }
    
    func testNotRoundingWith2Decimals() {
        let number: NSNumber = 122.38
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 122,38")
    }
    
    func testFormatMillionNumber() {
        let number: NSNumber = 85500400.557
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 85.500.400,56")
    }
    
    func testFormatBillionNumber() {
        let number: NSNumber = 1000000000.557
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 1.000.000.000,56")
    }
    
    func test1DigitNumber() {
        let number: NSNumber = 2
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 2,00")
    }
    
    func testFormatNegative() {
        let number: NSNumber = -2
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ -2,00")
    }
    
    func testAttributifyWithValidAmount() {
            let amount = "300.00"
            let attributedString = CurrencyHelper.attributify(amount: amount)
            
            XCTAssertEqual(attributedString.length, amount.count, "Attributed string length should match amount length")
            
            // assertions to check attributes
             XCTAssertEqual(attributedString.attribute(.font, at: 0, effectiveRange: nil) as? UIFont, UIFont(name: "Helvetica", size: CurrencyHelper.regularSize), "Regular font should be applied")
    
        }
}




