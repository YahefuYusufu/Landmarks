//
//  ToDoListItemView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//

import SwiftUI

struct ToDoListItemView: View {
   @StateObject var viewModel = ProfileViewViewModel()
   let item: TodoListItem
   
   var body: some View {
      HStack {
         VStack(alignment: .leading) {
            Text(item.title)
               .font(.body)
               .bold()
            Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated,time:.shortened))")
               .font(.footnote)
               .foregroundStyle(Color(.secondaryLabel))
         }
         Spacer()
         
         Button(action: {
            viewModel.toggleIsDone(item: item)
         }, label: {
            Image(systemName: item.isDone ? "checkmark.seal" : "checkmark.seal.fill")
               .tint(.green)
         })
      }
   }
}

#Preview {
   ToDoListItemView(item: TodoListItem(id: "asd",
                                       title: "ads",
                                       dueDate: Date().timeIntervalSince1970,
                                       createDate: Date().timeIntervalSince1970,
                                       isDone:false
                                      ))
}
