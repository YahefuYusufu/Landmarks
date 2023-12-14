//
//  DetailView.swift
//  PiaCoreData
//
//  Created by yusufyakuf on 2023-12-07.
//

import SwiftUI

struct DetailView: View {
   @State var currentTodo: Todo
   @State var addSub: String
   
    var body: some View {
       VStack {
          Text(currentTodo.title)
          
          Button(action: {
             currentTodo.done.toggle()
          }, label: {
             if currentTodo.done {
                Text("klar")
             } else {
                Text("Ej klar")
             }
          })
          HStack {
             TextField("Add till",text: $addSub)
             
             Button(action: {
                let newSub = SubStuff(subName: addSub)
                currentTodo.subSteps.append(newSub)
             }, label: {
                Text("ADD")
             })
          }
          
          List {
             ForEach(currentTodo.subSteps) { subThing in
                Text(subThing.subName)
             }
          }
       }
    }
}

#Preview {
   DetailView(currentTodo: Todo(title: "hej"), addSub: "")
      .modelContainer(for: [Item.self,Todo.self], inMemory: true)
}
