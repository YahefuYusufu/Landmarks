//
//  SwiftUIView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userId: String
    init(userId:String) {
        self.userId = userId
    }
    var body: some View {
        NavigationView {
            VStack {
                
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
                NewItemView( newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
