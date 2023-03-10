//
//  DetailView.swift
//  NightWatch
//
//  Created by Phillip Reynolds on 3/8/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var task: Task
    @Environment(\.verticalSizeClass) var verticlSizeClass
    
    var body: some View {
        VStack {
            Text(task.name)
            
            if verticlSizeClass == .regular {
                Divider()
                Text("Placeholder for task description")
            }
            Divider()
            Button("Mark Complete", action: {
                task.isCompleted = true
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(task: Binding<Task>.constant(Task(name: "Test", isCompleted: false, lastCompleted: nil)))
    }
}
