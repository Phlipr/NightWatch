//
//  TaskSectionHeader.swift
//  NightWatch
//
//  Created by Phillip Reynolds on 3/8/23.
//

import SwiftUI

struct TaskSectionHeader: View {
    let iconName: String
    let taskName: String
    
    var body: some View {
        HStack {
            Text(Image(systemName: iconName))
                .foregroundColor(.yellow)
                .font(.title3)
                .fontWeight(.heavy)
            Text(taskName)
                .underline()
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(.yellow)
                .textCase(.uppercase)
        }
    }
}

struct TaskSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        TaskSectionHeader(iconName: "moon.stars", taskName: "Nightly Tasks")
    }
}
