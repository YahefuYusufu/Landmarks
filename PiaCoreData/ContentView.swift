//
//  ContentView.swift
//  PiaCoreData
//
//  Created by yusufyakuf on 2023-12-07.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   @Environment(\.modelContext) private var modelContext
   @Query private var items: [Item]
//   @Query(sort: \Todo.title) private var todoItems: [Todo]
   @Query private var todoItems: [Todo]
   @Query private var allSub: [SubStuff]
   @State var addTodo = ""

    var body: some View {
        NavigationSplitView {
           VStack {
              
              HStack {
                 TextField("Add till",text: $addTodo)
                 
                 Button(action: {
                    
                    let newTodo = Todo(title: addTodo)
                    modelContext.insert(newTodo)
                 }, label: {
                    Text("ADD")
                 })
              }
              
              List {
                 ForEach(todoItems) { todothing in
                   
                    NavigationLink {
                       
                       DetailView(currentTodo: todothing, addSub: "")
                    } label: {
                       HStack {
                          Text(todothing.title)
                          
                          
                          if todothing.done {
                             Text("klar")
                          } else {
                             Text("inte klar")
                          }
                       }
                    }
                    
                 }
                 .onDelete(perform: deleteItems)
              }
           }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

   func getNotDone() {
      
   }
    private func addItem() {
        withAnimation {
           let newTodo = Todo(title:"buy milk")
            modelContext.insert(newTodo)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todoItems[index])
            }
        }
    }
}

#Preview {
    ContentView()
      .modelContainer(for: [Item.self,Todo.self], inMemory: true)
}
