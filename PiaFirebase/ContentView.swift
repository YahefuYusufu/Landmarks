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
         
         HStack {
            Spacer()
            Button(action: {
               events.filterTodo(newFilter: .all)
            }, label: {
               Text("All")
            })
            Spacer()
            Button(action: {
               events.filterTodo(newFilter: .done)
            }, label: {
               Text("Done")
            })
            Spacer()
            Button(action: {
               events.filterTodo(newFilter: .notdone)
            }, label: {
               Text("NotDone")
            })
            Spacer()
         }
         
         List {
            ForEach(events.todoItems,id: \.self.title) { todo in
               HStack {
                  Text(todo.title)
                 
                  VStack {
                     Image(systemName:todo.isdone ?   "pencil.circle.fill" : "pencil.circle")
                  }
                  .onTapGesture {
                     //                  print("click in " + todo.title)
                     events.changeDone(doneItem: todo)
                  }
                  Spacer()
                  
                  Button(action: {
                     events.deleteTodo(deleteItem: todo)
                  }, label: {
                     Text("x")
                  })
                  
                  //                  if todo.isdone {
                  //                     Text("KLAR")
                  //                  } else {
                  //                     Text("INTE KLAR")
                  //                  }
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


