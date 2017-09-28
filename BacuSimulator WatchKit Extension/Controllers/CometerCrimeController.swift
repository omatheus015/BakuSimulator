//
//  ComenterCrimeController.swift
//  BacuSimulator WatchKit Extension
//
//  Created by Gustavo Amaral on 27/09/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import WatchKit

class CometerCrimeController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        
        WKExtension().isFrontmostTimeoutExtended = true
    }
    
    @IBAction func handleCometerCrime() {
        
        let nextControllerIdentificer = StringMap.ControllerIdentifier.fugindoPolicia.rawValue
        self.pushController(withName: nextControllerIdentificer, context: nil)
    }
}
