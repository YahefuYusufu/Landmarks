//
//  SwiftUIView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [TodoListItem]
    
    private let userId: String
    init(userId:String) {
        self.userId = userId
        //users/<id>/todos/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button(action: {
                                //Delete
                                viewModel.delete(id: item.id)
                            }, label: {
                                Text("Delete")
                                    .background(.red)
                            })
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button(action: {
                    viewModel.showingNewItemView = true
                }, label: {
                    Image(systemName:"plus")
                })
            }
            //navigate to new item view
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView( 
                    newItemPresented: $viewModel.showingNewItemView
                )
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "bXVLyPIw4iNZrqo0kxBt7VuBKrQ2")
}
