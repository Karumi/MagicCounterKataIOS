//
//  MagicCounterKataIOSTests.swift
//  MagicCounterKataIOSTests
//
//  Created by Pedro Gómez on 29/11/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import XCTest
@testable import MagicCounterKataIOS

class DefaultsStorageTest: XCTestCase {

    private var storage: CounterStorage = DefaultsStorage()

    override func setUp() {
        storage.clear()
    }

    override func tearDown() {
        storage.clear()
    }

    func testReturnsNilIfTheCounterValueWasNotSavedBefore() {
        XCTAssertNil(storage.get())
    }

    func testReturnsTheValuePreviouslySaved() {
        let counter = 1

        storage.save(counter: counter)
        let result = storage.get()

        XCTAssertEqual(counter, result)
    }

    func testOverridesTheValuePreviouslySavedWithANewOne() {
        let counter = 1

        storage.save(counter: -1)
        storage.save(counter: counter)
        let result = storage.get()

        XCTAssertEqual(counter, result)
    }

}
