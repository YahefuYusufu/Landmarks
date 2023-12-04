//
//  ContentView.swift
//  PiaFirebase
//
//  Created by yusufyakuf on 2023-11-20.
//

import SwiftUI
import Firebase
import FirebaseStorage
import PhotosUI

struct ContentView: View {
   @State var addtodo = ""
   @StateObject var events = Event()
   @State var theImage: UIImage?
   @State var galleryImage: Image?
   @State private var selectedPhoto: PhotosPickerItem?
   
   
   var body: some View {
      VStack {
//         if galleryImage != nil {
//            galleryImage!
//               .resizable()
//               .frame(width: 100,height: 100)
//         }
//         PhotosPicker(selection: $selectedPhoto, matching: .images) {
//            Text("select image")
//         }
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
        testGetImage()
      }
//      .task(id: selectedPhoto) {
//         galleryImage = try? await selectedPhoto?.loadTransferable(type: Image.self)
//         testUpLoad(theImage: galleryImage!)
//      }
   }
   
   func testGetImage() {
      let storage = Storage.storage()
      let storageRef = storage.reference()
      let frog = storageRef.child("download.jpeg")
      print("image download")
      frog.getData(maxSize: 1 * 1024 * 1024) { data, error in
         if error != nil {
          
         } else {
            
            DispatchQueue.main.async {
               theImage = UIImage(data: data!)
            }
            print(data!.count)
         }
      }
   }
   
   
   func testUpLoad(theImage: Image) {
//      let storage = Storage.storage()
//      let storageRef = storage.reference()
      
//      let saveImage = storageRef.child("download.jpeg")
   }
   
}

#Preview {
   ContentView()
}


