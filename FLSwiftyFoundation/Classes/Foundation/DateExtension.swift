import Foundation

public extension Date {
    private var calendar: Calendar {
        Calendar.current
    }
    
    var second: Int {
        calendar.component(.second, from: self)
    }
    
    var minute: Int {
        calendar.component(.minute, from: self)
    }
    
    var hour: Int {
        calendar.component(.hour, from: self)
    }
    
    var weekDay: Int {
        calendar.component(.weekday, from: self)
    }
    
    var day: Int {
        calendar.component(.day, from: self)
    }
    
    var month: Int {
        calendar.component(.month, from: self)
    }
    
    /// Week of month.
    /// Date().weekOfMonth -> 3 // date is in third week of the month.
    var weekOfMonth: Int {
        calendar.component(.weekOfMonth, from: self)
    }
    
    /// Week of year.
    /// Date().weekOfYear -> 2 // second week in the year.
    var weekOfYear: Int {
        calendar.component(.weekOfYear, from: self)
    }
    
    var year: Int {
        calendar.component(.year, from: self)
    }
    
}
