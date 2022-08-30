//
//  FLExtension+Date.swift
//  FLSwiftyFoundation
//
//  Created by FeliksLv on 2022/8/30.
//

import Foundation

public extension Date {
    var ex: FLExtension<Date> { FLExtension(self) }
}


public extension FLExtension where Base == Date {
    private var calendar: Calendar {
        Calendar.current
    }
    
    var second: Int {
        calendar.component(.second, from: value)
    }
    
    var minute: Int {
        calendar.component(.minute, from: value)
    }
    
    var hour: Int {
        calendar.component(.hour, from: value)
    }
    
    var weekDay: Int {
        calendar.component(.weekday, from: value)
    }
    
    var day: Int {
        calendar.component(.day, from: value)
    }
    
    var month: Int {
        calendar.component(.month, from: value)
    }
    
    /// Week of month.
    /// Date().weekOfMonth -> 3 // date is in third week of the month.
    var weekOfMonth: Int {
        calendar.component(.weekOfMonth, from: value)
    }
    
    /// Week of year.
    /// Date().weekOfYear -> 2 // second week in the year.
    var weekOfYear: Int {
        calendar.component(.weekOfYear, from: value)
    }
    
    var year: Int {
        calendar.component(.year, from: value)
    }
}
