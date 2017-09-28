//
//  FimCrimeController.swift
//  BacuSimulator WatchKit Extension
//
//  Created by Gustavo Amaral on 27/09/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import WatchKit
import AVFoundation

fileprivate let PEGO_MSG = "#PARTIUCADEIA"
fileprivate let BECO_BTN_MSG = "Subornar"

class FimCrimeController: WKInterfaceController {
    
    @IBOutlet var fimCrimeLabel: WKInterfaceLabel!
    @IBOutlet var becoButton: WKInterfaceButton!
    
    var pego = false
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        guard let before = context as? Date else {
            print("There`s no before date.")
            return
        }
        
        let now = Date()
        let deltaTime = now.timeIntervalSince(before)
        
        if (deltaTime > 2 && deltaTime < 4) {
            self.fimCrimeLabel.setText(PEGO_MSG)
            self.becoButton.setTitle(BECO_BTN_MSG)
            self.pego = true
            
            let url = Bundle.main.url(forResource: "sirene", withExtension: "mp3")
            let asset = WKAudioFileAsset(url: url!)
            let item = WKAudioFilePlayerItem(asset: asset)
            let audioFile = WKAudioFilePlayer(playerItem: item)
            audioFile.play()
            
        }
    }
    
    @IBAction func handleBecoButton() {
        
        WKInterfaceController.reloadRootControllers(withNamesAndContexts: [ (StringMap.ControllerIdentifier.cometerCrimeController.rawValue, NSObject()) ])
        
        if self.pego {
            WKInterfaceDevice.current().play(WKHapticType.failure)
        } else {
            WKInterfaceDevice.current().play(WKHapticType.success)
        }
    }
    
}
