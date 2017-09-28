//
//  FugindoPoliciaController.swift
//  BacuSimulator WatchKit Extension
//
//  Created by Gustavo Amaral on 27/09/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import WatchKit

class FugindoPoliciaController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        
        guard let randomFutureDate = Date.random(between: 8, and: 15) else {
            print("Cannot generate random date.")
            return
        }
        
        WKExtension().scheduleBackgroundRefresh(withPreferredDate: randomFutureDate, userInfo: nil) { _ in
            //DOES NOTHING
        }
        WKInterfaceDevice.current().play(.start)
    }
}
