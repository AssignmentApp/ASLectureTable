//
//  File.swift
//  
//
//  Created by Lee Jaeho on 1/11/24.
//

import Foundation
import SwiftUI

public struct ASLecturetableConfiguration {
    public var cornerRadius: CGFloat
    public var borderWidth: CGFloat
    public var borderColor: Color
    public var timebar: TimebarConfiguration
    public var weekbar: WeekbarConfiguration
    
    public struct WeekbarConfiguration {
        public var font: Font
        public var height: CGFloat
        public var weekdays: [ASLecturetableData.Weekdays]
        
        public init(font: Font = .caption,
             height: CGFloat = 20,
             weekdays: [ASLecturetableData.Weekdays] = [.mon, .tue, .wed, .thu, .fri]) {
            self.font = font
            self.height = height
            self.weekdays = weekdays
        }
    }
    
    public struct TimebarConfiguration {
        public var font: Font
        public var width: CGFloat
        public var startAt: ASLecturetableData.Time
        public var endAt: ASLecturetableData.Time
        
        public init(font: Font = .caption,
             width: CGFloat = 17,
             startAt: ASLecturetableData.Time = .init(hour: 9, minute: 0),
             endAt: ASLecturetableData.Time = .init(hour: 17, minute: 0)) {
            self.font = font
            self.width = width
            self.startAt = startAt
            self.endAt = endAt
        }
    }
    
    public init(cornerRadius: CGFloat = 10,
                borderWidth: CGFloat = 1.3,
                borderColor: Color = .secondary,
                timebar: TimebarConfiguration = TimebarConfiguration(),
                weekbar: WeekbarConfiguration = WeekbarConfiguration()) {
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.timebar = timebar
        self.weekbar = weekbar
    }
}
