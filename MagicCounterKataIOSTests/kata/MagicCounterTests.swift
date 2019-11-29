//
//  MagicCounterTests.swift
//  MagicCounterKataIOSTests
//
//  Created by Pedro Gómez on 29/11/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import Foundation
import XCTest
@testable import MagicCounterKataIOS

class MagicCounterTests: XCTestCase {

    private var storage: DefaultsStorage!
    private var random: MockRandomGenerator!
    private var magicCounter: MagicCounter!

    override func setUp() {
        storage = DefaultsStorage()
        random = MockRandomGenerator()
        magicCounter = MagicCounter(storage: storage, randomGenerator: random)
        storage.clear()
    }

    func testReturnsTheRandomValueIfTheCounterWasNotSavedPreviouslyAndTheRandomValueIsGreaterThan100() {
        random.value = 101

        let result = magicCounter.increase()

        XCTAssertEqual(101, result)
    }

    func testReturns1IfTheCounterWasNotSavedPreviouslyAndTheRandomValueIsLowerOrEqualTo100() {
        random.value = 100

        let result = magicCounter.increase()

        XCTAssertEqual(1, result)
    }

    func testSavesTheCounterValueIfTheRandomNumberIsGreaterThan100() {
        random.value = 101

        magicCounter.increase()

        XCTAssertEqual(101, storage.get())
    }

    func testSavesTheCounterValueIfTheRandomNumberIsLowerOrEqualTo100() {
        random.value = 100

        magicCounter.increase()

        XCTAssertEqual(1, storage.get())
    }

    func testTwoConsecutiveIncrementsGreaterThan100ReturnsTheExpectedValue() {
        random.value = 101

        magicCounter.increase()
        let result = magicCounter.increase()

        XCTAssertEqual(202, result)
    }

    func testTwoConsecutiveIncrementsLowerOrEqualTo100ReturnsTheExpectedValue() {
        random.value = 99

        magicCounter.increase()
        let result = magicCounter.increase()

        XCTAssertEqual(2, result)
    }

    func testOneIncrementWithRandomValueLowerThan100AndAnotherOneGreaterThan100ReturnsTheExpectedValue() {
        random.value = 1

        magicCounter.increase()
        random.value = 101
        let result = magicCounter.increase()

        XCTAssertEqual(102, result)
    }

    func testOneIncrementGreaterThan100AndAnotherOneLowerThan100ReturnsTheExpectedValue() {
        random.value = 101

        magicCounter.increase()
        random.value = 1
        let result = magicCounter.increase()

        XCTAssertEqual(102, result)
    }

    func testIfThereWasNoPreviouslySavedValuesTheResultWillBeMinusOne() {
        let result = magicCounter.decrease()

        XCTAssertEqual(-1, result)
    }

    func testIfTheValueIsIncrementedTwiceWithoutAnyPreviouslySavedValueTheResultIsMinusTwo() {
        magicCounter.decrease()
        
        let result = magicCounter.decrease()

        XCTAssertEqual(-2, result)
    }

    func testIfTheValueWasPreviouslyIncreasedTheResultIsOneUnitLess() {
        random.value = 101

        magicCounter.increase()
        let result = magicCounter.decrease()

        XCTAssertEqual(100, result)
    }

}

private class MockRandomGenerator: RandomNumberGenerator {

    var value = 0

    func randomValue() -> Int {
        return value
    }

}
