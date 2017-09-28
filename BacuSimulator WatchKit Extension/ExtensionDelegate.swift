//
//  ExtensionDelegate.swift
//  BacuSimulator WatchKit Extension
//
//  Created by Gustavo Amaral on 27/09/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import WatchKit
import AVFoundation

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    var raiseHandTime: NSDate?
    
    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
    }

    func applicationDidBecomeActive() {
        
        guard let _raiseHandTime = self.raiseHandTime else {
            print("raiseHandTime from ExtensionDelegate is nil")
            return
        }
        
        WKInterfaceController.reloadRootControllers(
            withNamesAndContexts: [ (StringMap.ControllerIdentifier.fimCrimeController.rawValue, _raiseHandTime) ] )
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        // Sent when the system needs to launch the application in the background to process tasks. Tasks arrive in a set, so loop through and process each one.
        for task in backgroundTasks {
            // Use a switch statement to check the task type
            switch task {
            case let backgroundTask as WKApplicationRefreshBackgroundTask:
                
                WKInterfaceDevice.current().play(WKHapticType.directionUp)
                self.raiseHandTime = NSDate()
                
                backgroundTask.setTaskCompletedWithSnapshot(false)
            case let snapshotTask as WKSnapshotRefreshBackgroundTask:
                
                WKInterfaceDevice.current().play(WKHapticType.directionUp)
                self.raiseHandTime = NSDate()
                
                snapshotTask.setTaskCompleted(restoredDefaultState: true, estimatedSnapshotExpiration: Date.distantFuture, userInfo: nil)
            case let connectivityTask as WKWatchConnectivityRefreshBackgroundTask:
                // Be sure to complete the connectivity task once you’re done.
                connectivityTask.setTaskCompletedWithSnapshot(false)
            case let urlSessionTask as WKURLSessionRefreshBackgroundTask:
                // Be sure to complete the URL session task once you’re done.
                urlSessionTask.setTaskCompletedWithSnapshot(false)
            default:
                // make sure to complete unhandled task types
                task.setTaskCompletedWithSnapshot(false)
            }
        }
    }

}
