//
//  RandomNumberGenerator.swift
//  MagicCounterKataIOS
//
//  Created by Pedro Gómez on 29/11/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import Foundation

protocol RandomNumberGenerator {
    func randomValue() -> Int
}

class SystemRandomNumbergenerator {
    func randomValue() -> Int {
        return Int.random(in: Int.min...Int.max)
    }
}
