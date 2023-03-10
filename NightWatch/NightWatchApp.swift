//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Phillip Reynolds on 3/3/23.
//

import SwiftUI

@main
struct NightWatchApp: App {
    @StateObject private var nightWatchTasks = NightWatchTasks()
    
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTasks: nightWatchTasks)
        }
    }
}
