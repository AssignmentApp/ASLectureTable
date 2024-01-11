//
//  File.swift
//  
//
//  Created by Lee Jaeho on 1/11/24.
//

import Foundation
import SwiftUI

struct ASLecturetableLayout: Layout {
    var configuration: ASLecturetableConfiguration
    
    private var totalInterval: TimeInterval {
        var startAt = configuration.timebar.startAt
        startAt.minute = 0
        var endAt = configuration.timebar.endAt
        endAt.minute = 0
        return endAt.timeInterval(from: startAt)
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let minX = bounds.minX + configuration.timebar.width
        let minY = bounds.minY + configuration.weekbar.height
        
        let containerSize = CGSize(width: bounds.width-configuration.timebar.width,
                                   height: bounds.height-configuration.weekbar.height)
        
        for subview in subviews {
            if let time = subview[ASLecturetableDataKey.self],
               let offset = getOffset(time: time, containerSize: containerSize)  {
                let size = getSize(time: time, containerSize: containerSize)
                
                subview.place(at: CGPoint(x: minX+offset.x, y: minY+offset.y),
                              anchor: .topLeading, proposal: ProposedViewSize(size))
            } else {
                subview.place(at: .zero, anchor: .topLeading, proposal: .zero)
            }
        }
    }
    
    private func getOffset(time: ASLecturetableData, containerSize: CGSize) -> CGPoint? {
        guard let weekIndex = configuration.weekbar.weekdays.firstIndex(of: time.weekday) else { return nil }
        let weekWidth = getWeekWidth(containerSize: containerSize)
        
        var startAt = configuration.timebar.startAt
        startAt.minute = 0
        let timeInterval = time.startAt.timeInterval(from: startAt)
        let ratio = CGFloat(timeInterval/totalInterval)
        
        return CGPoint(x: max(0, CGFloat(weekIndex)*weekWidth),
                       y: max(0, ratio*containerSize.height))
    }
    
    private func getSize(time: ASLecturetableData, containerSize: CGSize) -> CGSize {
        let timeInterval = time.endAt.timeInterval(from: time.startAt)
        let ratio = timeInterval/totalInterval
        let weekWidth = getWeekWidth(containerSize: containerSize)
        
        return CGSize(width: max(0, weekWidth), 
                      height: max(0, containerSize.height*ratio))
    }
    
    private func getWeekWidth(containerSize: CGSize) -> CGFloat {
        containerSize.width/CGFloat(configuration.weekbar.weekdays.count)
    }
}
