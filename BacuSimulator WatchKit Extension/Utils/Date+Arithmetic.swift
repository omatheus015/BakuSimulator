//
//  Date+Arithmetic.swift
//  RavinIndustries
//
//  Created by Gustavo Amaral on 18/09/17.
//  Copyright © 2017 Gustavo Arthur Vollbrecht. All rights reserved.
//

import Foundation

extension Date {
    
    static func byAdding(seconds: Int) -> Date? {
        
        var dateComponents = DateComponents()
        dateComponents.second = seconds
        return Calendar.current.date(byAdding: dateComponents, to: Date())
    }
    
    static func byAdding(minutes: Int) -> Date? {
        
        var dateComponents = DateComponents()
        dateComponents.minute = minutes
        return Calendar.current.date(byAdding: dateComponents, to: Date())
    }
    
    static func byAdding(days: Int) -> Date? {
        
        var dateComponents = DateComponents()
        dateComponents.day = days
        return Calendar.current.date(byAdding: dateComponents, to: Date())
    }
    
    static func bySubtracting(days: Int) -> Date? {
        return Date.byAdding(days: -days)
    }
    
    static func byAdding(hours: Int) -> Date? {
        
        var dateComponents = DateComponents()
        dateComponents.hour = hours
        return Calendar.current.date(byAdding: dateComponents, to: Date())
    }
    
    static func bySubtracting(hours: Int) -> Date? {
        return Date.byAdding(hours: -hours)
    }
    
    static func random(between min: Int, and max: Int) -> Date? {
        
        let minutes = arc4random_uniform(UInt32(max)) + UInt32(min)
        return Date.byAdding(minutes: Int(minutes))
    }
}
