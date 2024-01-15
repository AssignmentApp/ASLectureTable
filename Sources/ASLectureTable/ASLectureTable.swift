// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct ASLectureTable<Content: View>: View {
    var configuration: ASLecturetableConfiguration
    @ViewBuilder
    var content: () -> Content
    
    public init(configuration: ASLecturetableConfiguration,
                @ViewBuilder content: @escaping () -> Content) {
        self.configuration = configuration
        self.content = content
    }
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            ASLecturetableBorderShape(configuration: configuration,
                                      onlyOutline: false)
            .stroke(lineWidth: configuration.borderWidth)
            .foregroundStyle(configuration.borderColor)
            ASLecturetableTimebar(configuration: configuration)
                .padding(.top, configuration.weekbar.height)
            ASLecturetableWeekbar(configuration: configuration)
                .padding(.leading, configuration.timebar.width)
            ASLecturetableLayout(configuration: configuration) {
                content()
            }
        }
        .clipShape(ASLecturetableBorderShape(configuration: configuration,
                                             onlyOutline: true))
    }
}


#Preview {
    ASLectureTable(configuration: ASLecturetableConfiguration()) {
        VStack(alignment: .leading) {
            Text("Lecture1")
                .fontWeight(.semibold)
            Text("Room")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.tertiary, in: RoundedRectangle(cornerRadius: 4))
        .foregroundStyle(Color.blue)
        .lecturetableData(data: .init(weekday: .tue,
                                      startAt: .init(hour: 12, minute: 30),
                                      endAt: .init(hour: 15, minute: 00)))
    }
}
