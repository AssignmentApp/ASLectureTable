//
//  File.swift
//  
//
//  Created by Lee Jaeho on 1/11/24.
//

import Foundation
import SwiftUI

public struct ASLecturetableBorderShape: Shape {
    var configuration: ASLecturetableConfiguration
    var onlyOutline: Bool
    
    public init(configuration: ASLecturetableConfiguration, onlyOutline: Bool) {
        self.configuration = configuration
        self.onlyOutline = onlyOutline
    }
    
    public func path(in rect: CGRect) -> Path {
        Path { path in
            if !onlyOutline {
                addTimeLines(bounds: rect, path: &path)
                addWeekLines(bounds: rect, path: &path)
            }
            addOutline(bounds: rect, path: &path)
        }
    }
    
    private func addTimeLines(bounds: CGRect, path: inout Path) {
        let minX = bounds.minX
        let maxX = bounds.maxX
        let weekHeight = configuration.weekbar.height
        let minY = bounds.minY + weekHeight
        let startAt = configuration.timebar.startAt
        let endAt = configuration.timebar.endAt
        
        let timeHeight = (bounds.height-weekHeight)/CGFloat(endAt.hour-startAt.hour)
        let times = Array(startAt.hour..<endAt.hour)
        
        for (index, _) in times.enumerated() {
            let y = minY+CGFloat(index)*timeHeight
            path.move(to: CGPoint(x: minX, y: y))
            path.addLine(to: CGPoint(x: maxX, y: y))
        }
    }
    
    private func addWeekLines(bounds: CGRect, path: inout Path) {
        let timeWidth = configuration.timebar.width
        let weekdays = configuration.weekbar.weekdays
        let minX = bounds.minX + timeWidth
        let minY = bounds.minY
        let maxY = bounds.maxY
        let weekWidth = (bounds.width-timeWidth)/CGFloat(weekdays.count)
        
        for (index, _) in weekdays.enumerated() {
            let x = minX+CGFloat(index)*weekWidth
            path.move(to: CGPoint(x: x, y: minY))
            path.addLine(to: CGPoint(x: x, y: maxY))
        }
    }
    
    private func addOutline(bounds: CGRect, path: inout Path) {
        let minX = bounds.minX
        let maxX = bounds.maxX
        let minY = bounds.minY
        let maxY = bounds.maxY
        
        let minCornerSize = min(configuration.timebar.width, configuration.weekbar.height)
        let cornerRadius = min(minCornerSize, configuration.cornerRadius)
        
        path.move(to: CGPoint(x: minX+cornerRadius, y: minY))
        path.addLine(to: CGPoint(x: maxX-cornerRadius, y: minY))
        path.addQuadCurve(to: CGPoint(x: maxX, y: minY+cornerRadius), control: CGPoint(x: maxX, y: minY))
        
        path.addLine(to: CGPoint(x: maxX, y: maxY-cornerRadius))
        path.addQuadCurve(to: CGPoint(x: maxX-cornerRadius, y: maxY), control: CGPoint(x: maxX, y: maxY))
        
        path.addLine(to: CGPoint(x: minX+cornerRadius, y: maxY))
        path.addQuadCurve(to: CGPoint(x: minX, y: maxY-cornerRadius), control: CGPoint(x: minX, y: maxY))
        
        path.addLine(to: CGPoint(x: minX, y: minY+cornerRadius))
        path.addQuadCurve(to: CGPoint(x: minX+cornerRadius, y: minY), control: CGPoint(x: minX, y: minY))
    }
}
