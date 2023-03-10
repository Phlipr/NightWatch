//
//  ContentView.swift
//  NightWatch
//
//  Created by Phillip Reynolds on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var nightWatchTasks: NightWatchTasks
    @State private var focusModeOn = false
    @State private var showResetAlert = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: TaskSectionHeader(iconName: "moon.stars", taskName: "NightlyTasks")) {
                    
                    let taskIndices = nightWatchTasks.nightlyTasks.indices
                    let tasks = nightWatchTasks.nightlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id: \.0.id) {
                        task, taskIndex in
                        let nightWatchTasksWrapper = $nightWatchTasks
                        
                        let taskBindings = nightWatchTasksWrapper.nightlyTasks
                        
                        let theTasksBinding = taskBindings[taskIndex]
                        
                        if !focusModeOn || (focusModeOn && !task.isCompleted) {
                            NavigationLink(destination: DetailView(task: theTasksBinding)) { TaskRow(task: task)
                            }
                        }
                    }.onDelete(perform: { indexSet in
                        nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: { indexSet, indices in
                        nightWatchTasks.nightlyTasks.move(fromOffsets: indexSet, toOffset: indices)
                    })
                }
                
                Section(header: TaskSectionHeader(iconName: "sunset", taskName: "Weekly Tasks")) {
                    
                    let taskIndices = nightWatchTasks.weeklyTasks.indices
                    let tasks = nightWatchTasks.weeklyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id: \.0.id) {
                        task, taskIndex in
                        let nightWatchTasksWrapper = $nightWatchTasks
                        
                        let taskBindings = nightWatchTasksWrapper.weeklyTasks
                        
                        let theTasksBinding = taskBindings[taskIndex]
                        
                        if !focusModeOn || (focusModeOn && !task.isCompleted) {
                            NavigationLink(destination: DetailView(task: theTasksBinding)) { TaskRow(task: task)
                            }
                        }
                    }.onDelete(perform: { indexSet in
                        nightWatchTasks.weeklyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: { indexSet, indices in
                        nightWatchTasks.weeklyTasks.move(fromOffsets: indexSet, toOffset: indices)
                    })
                }
                
                Section(header: TaskSectionHeader(iconName: "calendar", taskName: "Monthly Tasks")) {
                    
                    let taskIndices = nightWatchTasks.monthlyTasks.indices
                    let tasks = nightWatchTasks.monthlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id: \.0.id) {
                        task, taskIndex in
                        let nightWatchTasksWrapper = $nightWatchTasks
                        
                        let taskBindings = nightWatchTasksWrapper.monthlyTasks
                        
                        let theTasksBinding = taskBindings[taskIndex]
                        
                        if !focusModeOn || (focusModeOn && !task.isCompleted) {
                            NavigationLink(destination: DetailView(task: theTasksBinding)) { TaskRow(task: task)
                            }
                        }
                    }.onDelete(perform: { indexSet in
                        nightWatchTasks.monthlyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: { indexSet, indices in
                        nightWatchTasks.monthlyTasks.move(fromOffsets: indexSet, toOffset: indices)
                    })
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reset") {
                        showResetAlert =  true
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Toggle(isOn: $focusModeOn) {
                        Text("Focus Mode")
                    }
                }
            }
        }.alert(isPresented: $showResetAlert, content: {
            Alert(title: Text("Reset List"), message: Text("Are you sure?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Yes, reset it"), action: {
                    let refreshedNightWatchTasks = NightWatchTasks()
                    
                    self.nightWatchTasks.nightlyTasks = refreshedNightWatchTasks.nightlyTasks
                    self.nightWatchTasks.weeklyTasks = refreshedNightWatchTasks.weeklyTasks
                    self.nightWatchTasks.monthlyTasks = refreshedNightWatchTasks.monthlyTasks
                }))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let nightWatchTasks = NightWatchTasks()
        ContentView(nightWatchTasks: nightWatchTasks)
    }
}
