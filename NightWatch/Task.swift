//
//  Task.swift
//  NightWatch
//
//  Created by Phillip Reynolds on 3/9/23.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool
    var lastCompleted: Date?
}
