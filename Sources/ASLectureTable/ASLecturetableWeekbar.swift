//
//  File.swift
//  
//
//  Created by Lee Jaeho on 1/11/24.
//

import Foundation
import SwiftUI

struct ASLecturetableWeekbar: View {
    var configuration: ASLecturetableConfiguration
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(configuration.weekbar.weekdays, id: \.self) { weekday in
                Text(weekday.shortSymbol)
                    .font(configuration.weekbar.font)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(height: configuration.weekbar.height)
    }
}
