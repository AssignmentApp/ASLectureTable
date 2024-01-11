//
//  File.swift
//  
//
//  Created by Lee Jaeho on 1/11/24.
//

import Foundation
import SwiftUI

extension View {
    public func lecturetableData(data: ASLecturetableData) -> some View {
        layoutValue(key: ASLecturetableDataKey.self, value: data)
    }
}

struct ASLecturetableDataKey: LayoutValueKey {
    static var defaultValue: ASLecturetableData?
}
