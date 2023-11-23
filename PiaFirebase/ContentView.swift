//
//  ContentView.swift
//  PiaFirebase
//
//  Created by yusufyakuf on 2023-11-20.
//

import SwiftUI
import Firebase

struct ContentView: View {
   @State var addtodo = ""

   
   @StateObject var events = Event()
   
   var body: some View {
      VStack {
         HStack {
            TextField("Todo",text:$addtodo )
            
            Button(action: {
               events.saveTodo(addtodo:addtodo)
            },label: {
               Text("Save")
            })
         }
         
         List {
            ForEach(events.todoItems,id: \.self.title) { todo in
               HStack {
                  Text(todo.title)
                  Spacer()
                  Image(systemName:todo.isdone ?  "pencil.circle" : "pencil.circle.fill")
//                  if todo.isdone {
//                     Text("KLAR")
//                  } else {
//                     Text("INTE KLAR")
//                  }
               }
               .onTapGesture {
//                  print("click in " + todo.title)
                  events.changeDone(doneItem: todo)
               }
            }
         }
      }
      Button(action: {
         do {
            try Auth.auth().signOut()
         } catch {
            
         }
      }, label: {
         Text("Log Out")
      })
      .padding()
      .onAppear() {
         events.loadTodo()
         //           doStuff()
      }
   }
  
 
   
  
}

#Preview {
   ContentView()
}


