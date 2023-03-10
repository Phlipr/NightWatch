//
//  TaskRow.swift
//  NightWatch
//
//  Created by Phillip Reynolds on 3/9/23.
//

import SwiftUI

struct TaskRow: View {
    let task: Task
    
    var body: some View {
        VStack {
            if task.isCompleted {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundColor(.gray)
                        .strikethrough()
                }
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: Task(name: "Test", isCompleted: true, lastCompleted: nil))
    }
}
