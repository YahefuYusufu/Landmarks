//
//  TaskRowView.swift
//  DataPlanner
//
//  Created by yusufyakuf on 2023-11-08.
//

import SwiftUI

struct TaskRowView: View {
   @Binding var task: EventTask
   var isEditing: Bool
   @FocusState private var isFocused: Bool
   
   
   var body: some View {
      HStack {
         Button {
            task.isCompleted.toggle()
         } label: {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
         }
         .buttonStyle(.plain)
         
         if isEditing || task.isNew {
            TextField("Task description", text: $task.text)
               .focused($isFocused)
               .onChange(of: isFocused) { newValue in
                  if newValue == false {
                     task.isNew = false
                  }
               }
            
         } else {
            Text(task.text)
         }
         
         Spacer()
      }
      .padding(.vertical, 10)
      .task {
         if task.isNew {
            isFocused = true
         }
      }
   }
}

#Preview {
   TaskRowView(task: .constant(EventTask(text:"Do something! ")), isEditing: false)
}
