//
//  Task.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/22/24.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationData: Date = .init()
    var isCompleted: Bool = false
    var tint: Color
}

var sampleTask: [Task] = [
    .init(taskTitle: "Record Video", creationData: .updateHour(-5), isCompleted: true, tint: .red),
    .init(taskTitle: "Redesign Website", creationData: .updateHour(-3), isCompleted: true, tint: .blue),
    .init(taskTitle: "Go for a Walk", creationData: .updateHour(-4), isCompleted: true, tint: .green),
    .init(taskTitle: "Edit Video", creationData: .updateHour(0), isCompleted: true, tint: .black),
    .init(taskTitle: "Publish Video", creationData: .updateHour(2), isCompleted: true, tint: .red),
    .init(taskTitle: "Tweet about new Video!", creationData: .updateHour(1), isCompleted: true, tint: .green)

]


extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
