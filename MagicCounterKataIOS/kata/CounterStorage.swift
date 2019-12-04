//
//  CounterStorage.swift
//  MagicCounterKataIOS
//
//  Created by Pedro Gómez on 29/11/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import Foundation

protocol CounterStorage {
    func save(counter: Int)
    func get() -> Int?
    func clear()
}

class DefaultsStorage: CounterStorage {

    private static let counterKey = "DefaultsStorage_Key"

    private let defaults = UserDefaults.init()

    func save(counter: Int) {
        defaults.set(counter, forKey: DefaultsStorage.counterKey)
    }

    func get() -> Int? {
        if let value = defaults.object(forKey: DefaultsStorage.counterKey) {
            return value as? Int
        } else {
            return nil
        }
    }

    func clear() {
        defaults.removeObject(forKey: DefaultsStorage.counterKey)
    }
}
