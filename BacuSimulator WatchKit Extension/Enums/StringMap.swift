//
//  StringMap.swift
//  BacuSimulator WatchKit Extension
//
//  Created by Gustavo Amaral on 27/09/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation

struct StringMap {
    
    private init() { }
    
    enum ControllerIdentifier: String {
        case fugindoPolicia
        case fimCrimeController
        case cometerCrimeController
    }
    
    enum UserDefaults: String {
        case raiseHandTime
    }
}
