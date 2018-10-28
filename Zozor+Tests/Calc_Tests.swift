//
//  Calc_Tests.swift
//  CountOnMeTests
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalcTests: XCTestCase {

    let calc = Calc()

    func testGivenNil_WillEvaluateExpression_ThenExpressionIsFalse() {
        XCTAssertFalse(calc.isExpressionCorrect)
    }

    func testGivenTrueExpression_WillEvaluateExpression_ThenExpressionIsTrue() {
        calc.stringNumbers = ["1", "2"]

        XCTAssertTrue(calc.isExpressionCorrect)
    }

    func testGivenFalseExpression_WillEvaluateExpression_ThenExpressionIsFalse() {
        calc.stringNumbers = ["1", ""]

        XCTAssertFalse(calc.isExpressionCorrect)
    }

    func testGivenStringNumber_WillTestCanAddOperator_ThenCanAddOperatorIsTrue() {
        calc.stringNumbers = ["1"]

        XCTAssertTrue(calc.canAddOperator)
    }

    func testGivenNilStringNumber_WillTestCanAddOperator_ThenCanAddOperatorIsFalse() {
        calc.stringNumbers = ["1", ""]

        XCTAssertFalse(calc.canAddOperator)
    }

    func testGivenCalc_WillTestCanAddNumber_ThenResultIsEqualToGivenResult() {
        calc.addNewNumber(1)
        XCTAssertEqual(calc.stringNumbers, ["1"])
    }

    func testGivenExpression_WillCalculTotal_ThenResultIsEqualToGivenResult() {
        calc.operators = ["+", "-"]
        calc.stringNumbers = ["2", "1"]

        XCTAssertEqual(calc.calculateTotal(), "=\(1)")
    }

    func testGivenFalsexpression_WillCalculTotal_ThenResultEqualNil() {
        calc.operators = ["+", "+"]
        calc.stringNumbers = ["1", ""]

        XCTAssertNil(calc.calculateTotal())
    }

    func testGivenCalc_WillClear_ThenTestCalc() {
        calc.operators = ["+", "+"]
        calc.stringNumbers = ["1", ""]
        calc.index = 4

        calc.clear()
        XCTAssertEqual(calc.operators, ["+"])
        XCTAssertEqual(calc.stringNumbers, [""])
        XCTAssertEqual(calc.index, 0)
    }

}
