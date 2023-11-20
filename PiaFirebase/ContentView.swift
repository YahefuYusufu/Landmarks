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
   @State var todoItems = [TodoItem]()
   var body: some View {
      VStack {
         HStack {
            TextField("Todo",text:$addtodo )
            
            Button(action: {
               saveTodo()
            },label: {
               Text("Save")
            })
         }
         
         List {
            ForEach(todoItems,id: \.self.title) { todo in
               HStack {
                  Text(todo.title)
                  Image(systemName:todo.isdone ?  "pencil.circle" : "pencil.circle.fill")
                  Spacer()
                  
//                  if todo.isdone {
//                     Text("KLAR")
//                  } else {
//                     Text("INTE KLAR")
//                  }
               }
            }
         }
      }
      .padding()
      .onAppear() {
         loadTodo()
         //           doStuff()
      }
   }
   func saveTodo() {
      
      if addtodo == "" {
         // VARNA TOMT
         
         return
      }
      var ref: DatabaseReference!
      ref = Database.database().reference()
      
      var todoThing = [String:Any]()
      todoThing["todoTitle"] = addtodo
      todoThing["todoDone"] = false
      
      ref.child("todoList").childByAutoId().setValue(todoThing)
      
      
   }
   func loadTodo() {
      var ref: DatabaseReference!
      ref = Database.database().reference()
      ref.child("todoList").getData(completion: { error, snapshot in
         
         //         if let thetodo = snapshot?.value {
         //            addtodo = thetodo as! String
         //         }
         var allTheTodos = [TodoItem]()
         
         for todoChild in snapshot!.children {
            let childSnap = todoChild as! DataSnapshot
            print("EN TODO SAK")
            
            if let theTodo = childSnap.value as? [String : Any] {
               let tempTodo = TodoItem()
               tempTodo.title = theTodo["todoTitle"] as! String
               tempTodo.isdone = theTodo["todoDone"] as! Bool
               
               allTheTodos.append(tempTodo)
            }
            
            todoItems = allTheTodos
         }
      })
   }
   
   //   func doStuff () {
   //      var ref: DatabaseReference!
   //
   //      ref = Database.database().reference()
   //
   ////      ref.child("fruit").setValue("Banan")
   //      ref.child("fruit").getData(completion: { error, snapshot in
   //         var thefuit = snapshot?.value as! String
   //
   //         print(thefuit)
   //      })
   //   }
}

#Preview {
   ContentView()
}

class TodoItem {
   var title = ""
   var isdone:  Bool = false
   
   
}
