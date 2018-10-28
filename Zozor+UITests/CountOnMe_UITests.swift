//
//  Zozor_UITests.swift
//  CountOnMeUITests
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import XCTest

class CountOnMeUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testNumberTap() {
        for index in 0...9 {
            app.buttons["\(index)"].tap()
        }
    }

    func testPlusButton() {
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["+"].tap()
        app.alerts["Zéro!"].buttons["OK"].tap()
    }

    func testMinusButton() {
        app.buttons["1"].tap()
        app.buttons["-"].tap()
        app.buttons["-"].tap()
        app.alerts["Zéro!"].buttons["OK"].tap()
    }

    func testEqualButton() {
        app.buttons["="].tap()
        app.alerts["Zéro!"].buttons["OK"].tap()
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
    }

    func testScrollView() {
        for index in 0...50 {
            app.buttons["\(index % 10)"].tap()
        }
        app.children(matching: .window).element(boundBy:
            0).children(matching: .other).element.children(matching: .textView).element.swipeUp()
    }
}
