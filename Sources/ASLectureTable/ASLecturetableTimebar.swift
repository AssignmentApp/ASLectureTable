//
//  File.swift
//  
//
//  Created by Lee Jaeho on 1/11/24.
//

import Foundation
import SwiftUI

struct ASLecturetableTimebar: View {
    var configuration: ASLecturetableConfiguration
    private var times: Range<Int> {
        configuration.timebar.startAt.hour..<configuration.timebar.endAt.hour
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(times), id: \.self) { time in
                Text(String(time))
                    .font(configuration.timebar.font)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .topTrailing)
            }
        }
        .frame(width: configuration.timebar.width, alignment: .topTrailing)
    }
}
