//
//  ContentView.swift
//  PiaFirebase
//
//  Created by yusufyakuf on 2023-11-20.
//

import SwiftUI
import FirebaseDatabase

struct ContentView: View {
   @State var addtodo = ""
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
      }
      .padding()
              .onAppear() {
                 loadTodo()
      //           doStuff()
              }
   }
   func saveTodo() {
      var ref: DatabaseReference!
      ref = Database.database().reference()
      
      ref.child("todo").setValue(addtodo)
   }
   func loadTodo() {
      var ref: DatabaseReference!
      ref = Database.database().reference()
      ref.child("todo").getData(completion: { error, snapshot in
         
         if let thetodo = snapshot?.value {
            addtodo = thetodo as! String
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
