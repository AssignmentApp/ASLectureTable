//
//  File.swift
//  
//
//  Created by Lee Jaeho on 1/11/24.
//

import Foundation

public struct ASLecturetableData {
    public var weekday: Weekdays
    public var startAt: Time
    public var endAt: Time
    
    public struct Time: Comparable {
        var hour: Int
        var minute: Int
        
        public init(hour: Int, minute: Int) {
            self.hour = hour
            self.minute = minute
        }
        
        public init(date: Date) {
            self.hour = date.hour
            self.minute = date.minute
        }
        
        public static func < (lhs: ASLecturetableData.Time, rhs: ASLecturetableData.Time) -> Bool {
            lhs.hour*60+lhs.minute < rhs.hour*60+rhs.minute
        }
        
        public func timeInterval(from time: Time) -> TimeInterval {
            TimeInterval(((hour*60+minute)-(time.hour*60+time.minute))*60)
        }
    }
    
    public enum Weekdays: Int {
        case sun = 1
        case mon = 2
        case tue = 3
        case wed = 4
        case thu = 5
        case fri = 6
        case sat = 7
        
        var shortSymbol: String {
            Calendar.current.veryShortWeekdaySymbols[self.rawValue-1]
        }
    }
    
    public init(weekday: Weekdays, startAt: Time, endAt: Time) {
        self.weekday = weekday
        self.startAt = startAt
        self.endAt = endAt
    }
}
