//
//  Event.swift
//  PiaFirebase
//
//  Created by yusufyakuf on 2023-11-23.
//

import Foundation
import Firebase
import FirebaseStorage

enum TodoFilterType {
   case all,done,notdone
}


class Event: ObservableObject {
 
   @Published var todoItems = [TodoItem]()
   var allTodoItems = [TodoItem]()
   var filterType = TodoFilterType.all
   
   @Published var testImage: UIImage?
   var testId = UUID().uuidString
 
  

   func saveTodo(addtodo:String) {
      
      if addtodo == "" {
         // VARNA TOMT
         
         return
      }
      var ref: DatabaseReference!
      ref = Database.database().reference()
      
      var todoThing = [String:Any]()
      todoThing["todoTitle"] = addtodo
      todoThing["todoDone"] = false
      
      let uid = Auth.auth().currentUser!.uid
//      uid = "OFUR7Ga76nYykPEgNHOCDcIfpyw1"
      
      ref.child("todoList").child(uid).childByAutoId().setValue(todoThing)
      
      loadTodo()
      
      
   }
   
   func filterTodo(newFilter: TodoFilterType) {
      filterType = newFilter
      doTodoFilter()
   }
   func doTodoFilter() {
      if self.filterType == .all {
         todoItems = allTodoItems
      }
      if self.filterType == .done {
         todoItems = allTodoItems.filter { $0.isdone == true }
      }
      if self.filterType == .notdone {
         todoItems = allTodoItems.filter { $0.isdone != true}
      }
   }
   
   func loadTodo() {
     
      var ref: DatabaseReference!
      ref = Database.database().reference()
      
      let uid = Auth.auth().currentUser!.uid
      
      ref.child("todoList").child(uid).getData(completion: { error, snapshot in
         
         //         if let thetodo = snapshot?.value {
         //            addtodo = thetodo as! Strin
         //         }
         var allTheTodos = [TodoItem]()
         
         for todoChild in snapshot!.children {
            let childSnap = todoChild as! DataSnapshot
            print("EN TODO SAK")
            
            if let theTodo = childSnap.value as? [String : Any] {
               let tempTodo = TodoItem()
               tempTodo.todoId = childSnap.key
               tempTodo.title = theTodo["todoTitle"] as! String
               tempTodo.isdone = theTodo["todoDone"] as! Bool
               
               allTheTodos.append(tempTodo)
            }
            
            self.allTodoItems = allTheTodos
            self.doTodoFilter()
         }
      })
   }
   
   func changeDone(doneItem: TodoItem) {
      var ref: DatabaseReference!
      ref = Database.database().reference()
      let uid = Auth.auth().currentUser!.uid
      if doneItem.isdone == true {
         doneItem.isdone = false
      } else {
         doneItem.isdone = true
      }
      ref.child("todoList").child(uid).child(doneItem.todoId).child("todoDone").setValue(doneItem.isdone)
      
      loadTodo()
   }
   
   func deleteTodo(deleteItem: TodoItem) {
      var ref: DatabaseReference!
      ref = Database.database().reference()
      let uid = Auth.auth().currentUser!.uid
      
      ref.child("todoList").child(uid).child(deleteItem.todoId).removeValue()
      
      loadTodo()
   }
   
   func testGetImage() {
      let storage = Storage.storage()
      let storageRef = storage.reference()
      
      let frog = storageRef.child("download.jpeg")
      print("Image download")
      
      frog.getData(maxSize: 1 * 1024 * 1024) { data, error in
         if error != nil {
            print("get error")
         } else {
            
            DispatchQueue.main.async {
               self.testImage = UIImage(data: data!)
            }
            print(data!.count)
         }
      }
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
