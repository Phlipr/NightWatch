//
//  NightWatchTasks.swift
//  NightWatch
//
//  Created by Phillip Reynolds on 3/9/23.
//

import Foundation

class NightWatchTasks: ObservableObject {
    @Published var nightlyTasks: [Task] = [
        Task(name: "Check all windows", isCompleted: false, lastCompleted: nil),
        Task(name: "Check all doors", isCompleted: false, lastCompleted: nil),
        Task(name: "Check that the safe is locked", isCompleted: false, lastCompleted: nil),
        Task(name: "Check the mailbox", isCompleted: false, lastCompleted: nil),
        Task(name: "Inspect security cameras", isCompleted: false, lastCompleted: nil),
        Task(name: "Clear ice from sidewalks", isCompleted: false, lastCompleted: nil),
        Task(name: "Document \"strange and unusual\" occurrences", isCompleted: false, lastCompleted: nil)
    ]
    
    @Published var weeklyTasks: [Task] = [
        Task(name: "Check inside all vacant rooms", isCompleted: false, lastCompleted: nil),
        Task(name: "Walk the perimeter of the property", isCompleted: false, lastCompleted: nil)
    ]
    
    @Published var monthlyTasks: [Task] = [
        Task(name: "Test security alarm", isCompleted: false, lastCompleted: nil),
        Task(name: "Test motion detectors", isCompleted: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", isCompleted: false, lastCompleted: nil)
    ]
}
